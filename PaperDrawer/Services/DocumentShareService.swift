//
//  DocumentShareService.swift
//  PaperDrawer
//

import Foundation
import UIKit

enum DocumentShareService {
    private static let pageBounds = CGRect(x: 0, y: 0, width: 612, height: 792)
    private static let pageMargin: CGFloat = 24

    static func removeStaleTemporaryFiles() {
        try? FileManager.default.removeItem(at: sharingRootURL)
    }

    static func createPDF(from package: DocumentFileExportPackage) throws -> URL {
        guard !package.pages.isEmpty else {
            throw DocumentShareError.noPages
        }

        let images = try package.pages
            .sorted { $0.index < $1.index }
            .map { page -> UIImage in
                guard let image = UIImage(data: page.imageData) else {
                    throw DocumentShareError.unreadablePage(page.index + 1)
                }

                return image
            }

        let format = UIGraphicsPDFRendererFormat()
        format.documentInfo = [
            kCGPDFContextTitle as String: package.title,
            kCGPDFContextCreator as String: "PaperDrawer"
        ]

        let renderer = UIGraphicsPDFRenderer(bounds: pageBounds, format: format)
        let pdfData = renderer.pdfData { context in
            for image in images {
                context.beginPage()
                UIColor.white.setFill()
                context.cgContext.fill(pageBounds)

                image.draw(
                    in: aspectFitRect(
                        contentSize: image.size,
                        container: pageBounds.insetBy(dx: pageMargin, dy: pageMargin)
                    )
                )
            }
        }

        let directoryURL = sharingRootURL
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        try FileManager.default.createDirectory(at: directoryURL, withIntermediateDirectories: true)

        let fileURL = directoryURL.appendingPathComponent(fileName(for: package.title))
        try pdfData.write(to: fileURL, options: [.atomic, .completeFileProtection])
        return fileURL
    }

    static func removeTemporaryFile(at fileURL: URL) {
        try? FileManager.default.removeItem(at: fileURL.deletingLastPathComponent())
    }

    private static var sharingRootURL: URL {
        FileManager.default.temporaryDirectory
            .appendingPathComponent("PaperDrawer Shares", isDirectory: true)
    }

    private static func aspectFitRect(contentSize: CGSize, container: CGRect) -> CGRect {
        guard contentSize.width > 0, contentSize.height > 0 else {
            return container
        }

        let scale = min(container.width / contentSize.width, container.height / contentSize.height)
        let fittedSize = CGSize(width: contentSize.width * scale, height: contentSize.height * scale)

        return CGRect(
            x: container.midX - fittedSize.width / 2,
            y: container.midY - fittedSize.height / 2,
            width: fittedSize.width,
            height: fittedSize.height
        )
    }

    private static func fileName(for title: String) -> String {
        let allowed = CharacterSet.alphanumerics.union(CharacterSet(charactersIn: " -_"))
        let cleaned = String(
            title.unicodeScalars.map { scalar in
                allowed.contains(scalar) ? Character(scalar) : "-"
            }
        )
        .split(whereSeparator: \.isWhitespace)
        .joined(separator: " ")
        .trimmingCharacters(in: CharacterSet(charactersIn: "-_ "))

        let baseName = cleaned.isEmpty ? "Scanned Document" : String(cleaned.prefix(80))
        return "\(baseName).pdf"
    }
}

private enum DocumentShareError: LocalizedError {
    case noPages
    case unreadablePage(Int)

    var errorDescription: String? {
        switch self {
        case .noPages:
            "This document does not contain any scanned pages."
        case let .unreadablePage(pageNumber):
            "Page \(pageNumber) could not be read."
        }
    }
}
