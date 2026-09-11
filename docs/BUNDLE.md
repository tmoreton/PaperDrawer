# PaperDrawer bundle readiness

Audited September 11, 2026 for PaperDrawer 1.2 (build 7).

## Product record

| Field | Value |
| --- | --- |
| Product name | PaperDrawer |
| Description | A private document scanner that captures, recognizes, organizes, searches, and exports paper records on iPhone and iPad. |
| Platforms | iOS and iPadOS; device families iPhone and iPad; minimum OS 26.5 |
| Current version | 1.2 (build 7) |
| Copyright and licensor | Tim Moreton Jr. |
| App bundle ID | `reactnativenerd.DocScan` |
| iCloud container | `iCloud.reactnativenerd.DocScan` |
| SwiftData store | `DocScanStore` |
| Marketing URL | https://getpaperdrawer.com/ |
| Privacy policy | https://getpaperdrawer.com/privacy/ |
| Support URL | https://getpaperdrawer.com/support/ |
| Terms | https://getpaperdrawer.com/terms/ |
| App Store ID | `6808849656` |
| App Store URL | https://apps.apple.com/app/id6808849656 (available after Apple publishes the listing) |
| Planned U.S. price | $19, one-time purchase |
| First-party backend | None |

The customer-facing name is PaperDrawer. The PaperIndex project/target name and the original DocScan identifiers are intentionally preserved for App Store continuity and access to existing app, SwiftData, Files, and iCloud data.

## Position in the Productivity Bundle

The current standalone positioning and U.S. price ladder is:

| App | Positioning shorthand | Planned standalone price |
| --- | --- | ---: |
| Yaprflow | Wispr Flow alternative | $29 |
| Screencast.to | Loom / CleanShot / Screen Studio alternative | $29 |
| PaperDrawer | Scanner Pro alternative | $19 |

The three standalone prices total $77. The separate Productivity Bundle price remains undecided; it must be at least $29 and below $77 under Apple's paid-bundle pricing rule.

PaperDrawer is the bundle's local-first private document utility. Its primary uses are scanning receipts, statements, forms, letters, and notes; extracting searchable text; organizing documents; locating them by title or page contents; and exporting durable copies to Files or a local PDF.

Core features are:

- Apple's native multi-page document camera with automatic framing and cropping.
- On-device Vision OCR and in-app full-text search.
- Local rule-based titles and categories for every supported device.
- Optional on-device Apple Foundation Models summaries and keywords on eligible devices.
- A local SwiftData archive with optional private iCloud/CloudKit sync.
- User-visible JPEG, OCR text, and metadata exports in Files.
- Local PDF creation through the system share sheet.

PaperDrawer remains independently useful and purchasable. It does not need a launcher, shared account, central authentication service, subscription, or another bundle app.

## Local and hosted boundaries

Scanning, image encoding, OCR, categorization, Foundation Models generation, search, SwiftData persistence, PDF creation, and Files export run on the Apple device. The app has no `URLSession` networking layer, analytics, tracking, advertising, external AI API, developer-operated document server, or PaperDrawer account.

If the user enables iCloud for PaperDrawer, SwiftData uses the private CloudKit database and Files can use the user's iCloud Drive. Apple provides this service under the user's Apple Account. Private CloudKit data is not visible to the developer and counts against the user's iCloud storage quota. This is optional Apple platform infrastructure, not a first-party PaperDrawer backend.

The static marketing, privacy, terms, and support pages are hosted by GitHub Pages at the custom domain. Private support can use the owner's published email address, while nonsensitive bug reports can use the public GitHub issue tracker. These support channels receive only what the user deliberately sends and never automatically receive scans or OCR data from the app.

## Commercial distribution and GitHub

The intended official distribution is a paid-up-front App Store application at a planned U.S. base price of $19, with no in-app purchase or subscription. Ordinary entitlement comes from the customer's Apple Account and App Store purchase; no StoreKit integration is needed for the app's current local features.

Public source remains available under `LICENSE`. Developers can build it subject to that license, but on-device builds outside the official team need their own signing, bundle, and iCloud container configuration. Apple entitlement signing prevents self-built apps from accessing the official private iCloud container. Official branding, signed production binaries, automatic App Store updates, and support are separate from the source license.

The $19 U.S. base price follows the portfolio's standalone positioning rather than the earlier scanner-market benchmark. It values PaperDrawer as a private searchable archive while leaving the separate Productivity Bundle price to be chosen across the full three-app lineup.

The included PaperDrawer branding may be used only in private, undistributed local development builds under the narrow permission in `TRADEMARKS.md`. A distributed self-build must replace the official name, icon, logo, and presentation.

The repository currently has no tags, GitHub Releases, release assets, package feed, or repository-authored Actions workflow. GitHub Pages uses GitHub's managed deployment. Future GitHub releases may contain source archives or clearly identified development artifacts, but must not attach the same signed production binary sold through the App Store. Existing external legacy binaries, if any, do not need removal.

`scripts/build_app_store_release.sh` creates a Release archive, verifies its signature, and exports it with the credential-free `app-store/ExportOptions.plist`. It allows Xcode to refresh managed provisioning profiles, writes to the ignored `.build/` directory, and deliberately does not upload or submit the app. The App ID has iCloud/CloudKit and Push Notifications enabled.

## Licensing and third-party materials

Beginning with version 1.2 (build 7) on September 11, 2026, app-owned source and documentation are available under the PolyForm Shield License 1.0.0. The repository did not contain Apache-2.0 or another license before that date; earlier snapshots were visible under default copyright. Any separately distributed historical artifact that actually included Apache-2.0 remains under Apache-2.0 and is not retroactively relicensed.

There are no third-party runtime packages, bundled model weights, or bundled font files. Apple frameworks, services, system fonts, SF Symbols, and the system language model remain governed by Apple's terms. Generated-media provenance and exclusions are recorded in `THIRD_PARTY_NOTICES.md`; PaperDrawer branding is reserved in `TRADEMARKS.md`.

The human commit identities visible in git history are Tim Moreton and Tim Moreton Jr. using the same email address. One styling commit and its merge use automated coding-agent identities; no separate human contributor or external copyright notice is visible. The audit and ownership basis are recorded in `THIRD_PARTY_NOTICES.md`.

Tim Moreton Jr. has confirmed ownership of the repository, app-owned code, and all included project branding and marketing assets. The app icon, logo, website artwork, social preview, and screenshots may therefore be used in the official commercial distribution. This confirmation does not change Apple's rights in its platforms, frameworks, services, fonts, symbols, or marks.

## Ongoing costs and dependencies

- Apple Developer Program membership (currently USD 99 per membership year, subject to Apple and regional terms).
- Apple's commission and applicable taxes on App Store sales; these are distribution costs rather than hosted infrastructure.
- Renewal of `getpaperdrawer.com`.
- GitHub Pages and the public GitHub issue tracker under the repository owner's GitHub plan; no paid runtime is represented in this repository.
- Private CloudKit/iCloud storage uses the customer's iCloud quota; no developer-operated storage bill is represented in the current architecture.

## Existing-user compatibility

The 1.2 commercial generation keeps `reactnativenerd.DocScan`, `iCloud.reactnativenerd.DocScan`, `DocScanStore`, the app Documents directory, and existing preference keys. The persisted document/page fields are unchanged. Version 1.2 removes system Spotlight eligibility from sensitive library fields and performs a one-time deletion of the app's legacy Core Spotlight index; in-app search remains intact. User-directed text and image exports in Files or iCloud Drive remain subject to Apple's system indexing settings. The existing `PaperIndex Archive` to `PaperDrawer Archive` Files migration remains in place.

Because 1.2 remains an update on the same App Store record, people who acquired an earlier free version should retain update and redownload access; changing the price charges new first-time acquisitions rather than converting existing users into a new paid entitlement. Confirm this grandfathering behavior in App Store Connect when scheduling the price change.

Upgrade verification must cover an installed 1.1 (build 6) data set on iPhone and iPad, Files exports, private CloudKit sync, and both the old and current archive folder names. Never respond to a migration failure by deleting a user's store.

The app currently relies on SwiftData's automatic migration and has no explicit `VersionedSchema`. If the model container cannot open, version 1.2 now preserves the existing store and presents a recovery screen with a manual retry action instead of terminating, resetting, or silently substituting an empty store. A simulator smoke test cannot cover every prior store or CloudKit state, so backed-up physical-device upgrade testing remains a release gate. New and rewritten Files exports use complete file protection; existing 1.1 exports are retained rather than rewritten and therefore keep their prior protection attributes until re-exported.

## App Store and bundle gates

Repository-side metadata, icons, privacy manifest, camera purpose text, ownership records, URLs, and Debug/Release configurations are present. The following external steps remain before sale:

1. Verify Apple's current Paid Apps Agreement and tax/banking details are active. A successful free-app upload does not by itself confirm paid-app financial readiness.
2. Apply the selected $19 U.S. base price, then choose the tax category, territories, availability date, manual/automatic/phased release option, age rating, content-rights answers, and export-compliance answers. Complete Digital Services Act trader status for applicable EU distribution, answer the regulated-medical-device question as **No** unless the product scope changes, and leave App Store Connect's custom EULA field empty so Apple's Standard EULA applies.
3. The public support and App Review email is confirmed as `tmoreton89@gmail.com`. Add a monitored international-format phone number to App Review Information, then publish the new support/policy/site revisions before uploading the app. The repository change alone does not make `https://getpaperdrawer.com/support/` live.
4. When PaperDrawer is live, activate the website's primary CTA with `https://apps.apple.com/app/id6808849656`. Add a separate Productivity Bundle URL only after that bundle is live; until then keep the bundle CTA disabled or label it as coming soon.
5. Deploy and verify the SwiftData schema for `iCloud.reactnativenerd.DocScan` in CloudKit Production.
6. **Completed September 11, 2026:** Push Notifications are enabled on the existing App ID, Xcode regenerated the managed development and App Store profiles, and the exported 1.2 (7) build contains production `aps-environment`, CloudKit Production, and `get-task-allow` disabled.
7. Decide how the submitted 1.1 (6) should complete. If it finishes review first, upload PaperDrawer 1.2 (7) as the next version. If it must be replaced within the existing 1.1 version record, withdraw that submission and produce a 1.1 (7) replacement instead of uploading the current 1.2 binary. In either path, use the existing App Store record `6808849656`.
8. Confirm App Store Connect does not offer this build as an iPhone/iPad-compatible app on Apple-silicon Mac or Apple Vision Pro. The project now disables both untested compatibility modes.
9. Test local Files and iCloud Drive behavior plus create/edit/delete sync on two signed physical devices.
10. Upload the supplied final 6.9-inch iPhone and 13-inch iPad screenshot sets and verify their order in App Store Connect; the 6.5-inch files are retained only as legacy references.
11. Confirm Yaprflow ($29), Screencast.to ($29), and PaperDrawer ($19) are owned in the same App Store Connect account, which is required to select them for one multi-app bundle.
12. When every member app is paid and Ready for Distribution, create the App Store multi-app bundle and keep each app individually available. Set the paid bundle price at least as high as its highest-priced member ($29) and below the $77 sum of the individual prices.

The narrow iOS/iPadOS 26.5 deployment target also limits the potential paid audience. Lowering it to 26.0 is a product decision; older systems would require availability-isolating the Foundation Models integration.
