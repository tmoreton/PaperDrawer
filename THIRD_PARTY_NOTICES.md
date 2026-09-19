# Third-party notices

Audited September 19, 2026.

PaperDrawer does not vendor or bundle third-party source libraries, binary SDKs, model files, or font files. The Xcode project has no Swift Package Manager, CocoaPods, or Carthage dependencies.

## Apple platform components

PaperDrawer uses Apple platform frameworks, services, system fonts, and SF Symbols supplied through Xcode and Apple operating systems. These components are not licensed under the PaperDrawer license and remain subject to Apple's applicable terms. They include Core Spotlight, Foundation, Foundation Models, ImageIO, SwiftData, SwiftUI, UIKit, Uniform Type Identifiers, Vision, VisionKit, CloudKit, iCloud Drive, system fonts, and SF Symbols.

The Foundation Models integration uses Apple's on-device `SystemLanguageModel`. No model weights are included in the application or repository.

Version 1.2 uses Core Spotlight only to remove the app's legacy search index. PaperDrawer no longer submits document titles, categories, summaries, keywords, or recognized text for system indexing; search remains inside the app.

## Generated marketing media

`docs/assets/paperdrawer-social-preview.png` was generated using OpenAI gpt-image 2.0, as recorded by its embedded C2PA provenance metadata. No OpenAI software, SDK, service credential, or model is included in PaperDrawer.

## Project assets

The repository owner has confirmed ownership and commercial rights for the app icons, PaperDrawer logo treatment, social preview, and App Store screenshots. These are project branding or marketing assets rather than third-party runtime components. They are excluded from the software license as described in `LICENSE` and `TRADEMARKS.md`.
