# PaperDrawer

**A private, searchable document scanner for iPhone and iPad. Useful software without another subscription.**

[Download on the App Store](https://apps.apple.com/us/app/paperdrawer/id6808849656) · [Website](https://getpaperdrawer.com/) · [Privacy](https://getpaperdrawer.com/privacy/) · [Support](https://getpaperdrawer.com/support/) · [Terms](https://getpaperdrawer.com/terms/)

PaperDrawer turns receipts, statements, forms, and notes into a calm, searchable archive. It captures pages with Apple's document camera, recognizes their text on-device, organizes them, and writes understandable copies to Files.

## Privacy at a glance

PaperDrawer does not operate a server and does not include analytics, advertising, tracking, or third-party SDKs. It does not create an account or send scans, recognized text, or document metadata to the PaperDrawer developer.

- Scanning uses Apple's native `VisionKit` document camera.
- OCR uses Apple's `Vision` framework on the device.
- Titles, summaries, keywords, and categories use Apple's on-device Foundation Models when available, with a local rule-based fallback.
- Search runs locally against the saved document index.
- Documents are stored in the app's SwiftData library and exported to Files.
- When the user enables iCloud, Apple may sync the private SwiftData store through CloudKit and Files copies through the user's private iCloud Drive account.

In short: **document processing stays on the device, and no document data is sent to a PaperDrawer-controlled service.** Optional iCloud syncing is handled by Apple under the user's Apple Account settings.

See the full [Privacy Policy](https://getpaperdrawer.com/privacy/) for storage and deletion details.

## What it does

1. Captures and crops one or more pages with the system document scanner.
2. Recognizes text locally and preserves a high-quality JPEG for each page.
3. Creates a title and category immediately, then enriches metadata on supported devices.
4. Saves a searchable library record and exports page images plus OCR text to Files.
5. Searches titles, summaries, categories, keywords, and recognized page text.

## Technology

| Technology | How PaperDrawer uses it |
| --- | --- |
| Swift 5 and SwiftUI | Native app structure and accessible interface |
| VisionKit | Multi-page document capture and automatic page cropping |
| Vision | Accurate, language-aware on-device text recognition |
| Foundation Models | On-device title, summary, keyword, and category enrichment when supported |
| SwiftData | Local document, page, and searchable metadata persistence |
| CloudKit | Optional sync of the private SwiftData database through the user's iCloud account |
| iCloud Drive and FileManager | User-visible page images, document information, and OCR text exports |
| UIKit and Uniform Type Identifiers | Image handling and Files integration |

There are no third-party runtime dependencies.

## Data flow

```text
Camera
  └─> VisionKit page capture
       └─> Vision OCR (on device)
            └─> local categorization / Foundation Models (on device)
                 ├─> SwiftData library on this device
                 ├─> Files export on this device
                 └─> optional private iCloud sync controlled by the user
```

PaperDrawer contains no application networking layer. Apple system frameworks may communicate with iCloud only when the user has enabled the relevant iCloud services.

## Requirements

- Xcode with the iOS 26.5 SDK
- iOS or iPadOS 26.5 or later
- An iPhone or iPad camera for live document capture
- A supported Apple Intelligence device for Foundation Models enrichment; core scanning, OCR, rule-based categorization, storage, and search continue to work without it

## Build

Open `PaperDrawer.xcodeproj` in Xcode and run the `PaperDrawer` scheme, or build from Terminal:

```sh
xcodebuild \
  -project PaperDrawer.xcodeproj \
  -scheme PaperDrawer \
  -destination 'platform=iOS Simulator,name=iPhone 17 Pro' \
  build
```

The customer-facing product name, source folder, Xcode project, target, scheme, and built product are all PaperDrawer. The original bundle, iCloud container, and SwiftData store identifiers remain unchanged so updates keep the same App Store identity and existing user data.

On-device builds made outside the PaperDrawer development team need their own Apple signing identity, bundle identifier, and iCloud container. Those identifiers are configuration, not service credentials; Apple signing prevents an unrelated build from accessing PaperDrawer's private iCloud container.

## Distribution

PaperDrawer is available as a one-time App Store purchase. It requires no PaperDrawer account and contains no subscription or in-app purchase.

The source remains publicly inspectable and developers may build it under the repository license. Official App Store builds provide the signed production binary, the PaperDrawer branding, automatic App Store updates, and official support. Future GitHub releases must not attach the same signed production binary distributed through the App Store; source archives or clearly identified development artifacts may remain available.

[Download PaperDrawer from the App Store](https://apps.apple.com/us/app/paperdrawer/id6808849656). The configured U.S. price is **$19 as a one-time purchase**; the App Store determines comparable prices in other storefronts.

Create the archive and exported release with:

```sh
scripts/build_app_store_release.sh
```

The script lets Xcode refresh managed provisioning profiles, writes only to the ignored `.build/` directory, and does not upload or submit the app.

## Project structure

```text
PaperDrawer/
├── Models/       SwiftData document and page models
├── Services/     OCR, metadata, search, scan processing, and Files export
├── Views/        SwiftUI archive, detail, scanner, and storage views
└── ContentView.swift

docs/             GitHub Pages website, privacy policy, and terms
```

## Contributing

Bug reports are welcome, but never include real scans, OCR text, account numbers, health information, or other sensitive data. Read [CONTRIBUTING.md](CONTRIBUTING.md) before proposing code; contributions require prior agreement so ownership and licensing remain clear. Report vulnerabilities privately as described in [SECURITY.md](SECURITY.md).

## License

Beginning with PaperDrawer 1.2 (build 7) on September 11, 2026, app-owned source code and documentation are source available under the [PolyForm Shield License 1.0.0](LICENSE). Branding is reserved separately in [TRADEMARKS.md](TRADEMARKS.md), and platform/generated-material details are recorded in [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).

This repository did not previously contain an Apache-2.0 license, so earlier public snapshots remain under default copyright. Any historical artifact separately distributed with a valid Apache-2.0 license remains under that license; this change is not retroactive.
