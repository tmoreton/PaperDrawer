//
//  PaperDrawerApp.swift
//  PaperDrawer
//
//  Created by Homelab on 8/21/26.
//

import CoreSpotlight
import Combine
import OSLog
import SwiftData
import SwiftUI

@main
struct PaperDrawerApp: App {
    @StateObject private var modelStore: PaperDrawerModelStore

    init() {
        DocumentShareService.removeStaleTemporaryFiles()
        LegacySpotlightIndexCleanup.startIfNeeded()
        _modelStore = StateObject(wrappedValue: PaperDrawerModelStore())
    }

    var body: some Scene {
        WindowGroup {
            switch modelStore.state {
            case .opening:
                ModelStoreOpeningView()
            case .ready(let modelContainer):
                ContentView()
                    .modelContainer(modelContainer)
            case .unavailable:
                ModelStoreUnavailableView(retryAction: modelStore.retry)
            }
        }
    }
}

private final class PaperDrawerModelStore: ObservableObject {
    enum State {
        case opening
        case ready(ModelContainer)
        case unavailable
    }

    @Published private(set) var state: State = .opening

    private let logger = Logger(
        subsystem: "reactnativenerd.DocScan",
        category: "Persistence"
    )

    init() {
        openContainer()
    }

    func retry() {
        openContainer()
    }

    private func openContainer() {
        state = .opening

        let schema = Schema([
            ScannedDocument.self,
            ScannedPage.self
        ])

        #if targetEnvironment(simulator)
        let configuration = ModelConfiguration("DocScanStore", schema: schema)
        #else
        let configuration = ModelConfiguration(
            "DocScanStore",
            schema: schema,
            cloudKitDatabase: .private("iCloud.reactnativenerd.DocScan")
        )
        #endif

        do {
            let modelContainer = try ModelContainer(
                for: schema,
                configurations: [configuration]
            )
            state = .ready(modelContainer)
        } catch {
            // Keep the existing store untouched. A new or in-memory fallback could
            // make an intact library appear empty and allow writes that never sync.
            logger.error(
                "Unable to open the PaperDrawer model container: \(String(describing: error), privacy: .private)"
            )
            state = .unavailable
        }
    }
}

private struct ModelStoreOpeningView: View {
    var body: some View {
        ProgressView("Opening document library…")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(PaperDrawerStyle.background)
    }
}

private struct ModelStoreUnavailableView: View {
    let retryAction: () -> Void

    var body: some View {
        ContentUnavailableView {
            Label("Document Library Unavailable", systemImage: "externaldrive.badge.exclamationmark")
        } description: {
            Text(
                "PaperDrawer couldn’t open its private document library. Check iCloud Drive and available device storage, then try again. Your documents have not been deleted or replaced."
            )
        } actions: {
            Button("Try Again", systemImage: "arrow.clockwise", action: retryAction)
                .buttonStyle(.borderedProminent)
                .tint(PaperDrawerStyle.blue)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(PaperDrawerStyle.background)
    }
}

private enum LegacySpotlightIndexCleanup {
    private static let completionKey = "hasRemovedLegacySpotlightIndex"

    static func startIfNeeded() {
        guard !UserDefaults.standard.bool(forKey: completionKey) else {
            return
        }

        CSSearchableIndex.default().deleteAllSearchableItems { error in
            guard error == nil else {
                return
            }

            UserDefaults.standard.set(true, forKey: completionKey)
        }
    }
}
