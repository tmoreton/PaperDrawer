# PaperDrawer App Store submission assets

This folder contains the English (U.S.) product-page copy and final simulator screenshots for PaperDrawer 1.2. The 6.9-inch iPhone and 13-inch iPad sets reflect the final 1.2 interface and were uploaded to App Store Connect on September 11, 2026.

The configured U.S. base price is **$19 as a one-time purchase**. App Store Connect generates the localized storefront prices from that base price. The app is live at [apps.apple.com/us/app/paperdrawer/id6808849656](https://apps.apple.com/us/app/paperdrawer/id6808849656).

## Screenshot sets

Upload the numbered files in order. Every image is a JPEG without transparency and shows the real PaperDrawer app running with fictional demo documents.

| Folder | Resolution | App Store Connect use |
| --- | --- | --- |
| `assets/screenshots/iphone-6.9/` | 1320 × 2868 portrait | Final set for the current 6.9-inch iPhone display slot |
| `assets/screenshots/ipad-13/` | 2064 × 2752 portrait | Final set for the required 13-inch iPad display slot |

The six screenshots cover:

1. Private, on-device first-run state
2. Searchable document archive
3. Search across recognized page text
4. Explicit save confirmation
5. Document detail and Files copy
6. On-device recognition and save progress

Apple accepts one to ten screenshots per device size. App previews are optional.

## Other assets

- `assets/app-icon-1024.png` — flattened 1024 × 1024 RGB icon with no alpha channel
- `METADATA.md` — product-page copy, URLs, review notes, and privacy answers
- `ExportOptions.plist` — automatic App Store Connect distribution export settings with no credentials

## Building the App Store release

Run:

```sh
scripts/build_app_store_release.sh
```

The script allows Xcode to refresh managed provisioning profiles and creates a uniquely named archive and exported release beneath the ignored `.build/` directory. It does not upload or submit the app. Inspect the exported entitlements, validate the build in Organizer, and upload it through Xcode or Transporter.

## Reproducing the screenshots

Debug builds accept fictional preview data arguments that are excluded from Release builds. Build the app for the simulator, then run:

```sh
scripts/capture_app_store_screenshots.sh \
  <simulator-udid> \
  <path-to-PaperDrawer.app> \
  .build/app-store-source/<device-name>
```

The source captures are intentionally written to the ignored `.build/` directory. Convert final captures to JPEG before upload so they contain no alpha channel. The checked-in final 6.9-inch iPhone and 13-inch iPad images are already RGB JPEGs without transparency.
