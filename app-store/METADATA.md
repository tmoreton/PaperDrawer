# PaperDrawer — App Store metadata

## Product page

- **Name:** PaperDrawer
- **Subtitle:** Private document scanner
- **Primary category:** Productivity
- **Secondary category:** Utilities
- **Marketing URL:** https://getpaperdrawer.com/
- **Support URL:** https://getpaperdrawer.com/support/
- **Privacy Policy URL:** https://getpaperdrawer.com/privacy/
- **Website Terms URL (linked inside the app):** https://getpaperdrawer.com/terms/
- **App Store ID:** 6808849656
- **Public App Store URL when approved:** https://apps.apple.com/app/id6808849656
- **Planned U.S. base price:** $19, one-time purchase
- **App Store License Agreement:** Apple Standard EULA; do not enter a custom EULA in App Store Connect
- **Copyright:** 2026 Tim Moreton Jr.

## Promotional text

Turn receipts, statements, forms, and notes into a private searchable archive—with on-device OCR and clear copies in Files.

## Description

PaperDrawer turns paper into a private, searchable archive on iPhone and iPad. One purchase. No subscription. No PaperDrawer account.

Scan receipts, statements, forms, letters, and notes with Apple's native document camera. PaperDrawer recognizes the text on your device, creates useful document details, and makes every saved page easy to find again.

PRIVATE BY DESIGN

Document scanning, OCR, organization, and search happen on your device. PaperDrawer has no account, advertising, analytics, tracking, or developer-operated document server. Search stays inside PaperDrawer; the app does not submit library records to system search. Copies you keep in Files or iCloud Drive may be indexed by Apple according to your settings.

SEARCH THE PAGE, NOT JUST THE TITLE

Find documents using words that appear anywhere in the recognized text, as well as titles, categories, summaries, and keywords.

KNOW WHERE EVERY COPY LIVES

PaperDrawer clearly shows when a document is searchable and when its Files copy has been created. Each export includes the scanned page images, recognized text, and useful document information.

BUILT FOR APPLE DEVICES

PaperDrawer uses native Apple frameworks for document capture, on-device text recognition, storage, and optional private iCloud sync. No third-party runtime SDKs are included.

Optional iCloud features are controlled by your Apple Account settings and handled by Apple. OCR results can contain mistakes, so compare important information with the original document.

## Keywords

OCR,receipt,invoice,PDF,scan,paperless,search,archive,statement,form,letter,filing,privacy,organizer

## What’s New in Version 1.2

PaperDrawer 1.2 improves privacy and reliability. Camera access is now requested only after you choose Scan. Search stays inside PaperDrawer and the prior Spotlight index is removed. New Files exports and temporary share PDFs receive stronger device protection, and a new information menu links directly to privacy, support, terms, and source. Existing library records and Files exports are preserved during the update.

## App Review information

- **First name:** Tim
- **Last name:** Moreton
- **Email:** tmoreton89@gmail.com (confirmed by the owner)
- **Phone:** Enter a monitored international-format phone number in App Store Connect; this is required for App Review but is not published on the product page.
- **Sign-in required:** No
- **Demo account:** Not applicable

## App Review notes

PaperDrawer does not require an account or sign-in. Tap **Scan** and capture any printed page to exercise the main flow. Live document capture requires a physical iPhone or iPad camera. The information button beside **Scan** provides in-app links to the privacy policy, support page, terms, and inspectable source.

After capture, OCR runs on-device. The app saves the searchable library record and writes JPEG page images, `OCR Text.txt`, and `Document Info.txt` to its Files container. If the review device has iCloud Drive enabled for PaperDrawer, it also writes a copy there.

This is a paid-up-front app. There are no in-app purchases, subscriptions, ads, analytics, external AI APIs, or developer-operated backend services.

## App Privacy answers

Based on the current source and Apple's definition of collection:

- **Data collection:** No, PaperDrawer does not collect data from this app.
- **Tracking:** No.
- **Privacy Policy URL:** https://getpaperdrawer.com/privacy/
- **User Privacy Choices URL:** https://getpaperdrawer.com/privacy/#retention-and-deletion (optional)

Apple states that data processed only on-device is not “collected,” and developers are not responsible for disclosing data collected by Apple. Reconfirm these answers if networking, analytics, crash reporting, or third-party SDKs are added.

## Submission checklist

- [x] App icon included in the build
- [x] Final iPhone 6.9-inch screenshots at accepted dimensions and without transparency
- [x] 6.5-inch slot does not require a separate upload when the supplied 6.9-inch set is used; legacy images are retained only as reference
- [x] Final iPad 13-inch screenshots at accepted dimensions and without transparency
- [x] Updated privacy policy prepared in `docs/privacy/`
- [x] Updated website terms prepared in `docs/terms/`
- [x] Privacy manifest declaring no collection/tracking and the app-local UserDefaults reason
- [x] Encryption declaration included in the app Info.plist
- [x] Privacy policy and support links available inside the app
- [x] Public iCloud Drive document-scope metadata included
- [x] Remote notifications background mode declared for SwiftData CloudKit
- [x] Source-available license, third-party notices, and trademark policy included
- [x] Copyright owner confirmed as Tim Moreton Jr.
- [x] Repository owner confirmed commercial rights to all included project assets
- [x] Public support and App Review email confirmed as `tmoreton89@gmail.com`
- [x] Existing App Store record confirmed as Apple ID 6808849656; version 1.1 (6) was uploaded successfully on September 10, 2026
- [x] U.S. base price selected as **$19**, paid once with no in-app purchase or subscription
- [ ] Enter a monitored international-format phone number in App Review Information
- [ ] Publish and verify all site revisions; the live site still contains the previous free/open-source copy and `/support/` currently returns 404
- [ ] Decide whether to let the submitted 1.1 (6) finish review and submit 1.2 (7) afterward, or withdraw and replace the 1.1 submission; replacing its existing version record may require a 1.1 (7) build instead
- [ ] Verify the current Paid Apps Agreement and tax/banking setup are active
- [ ] Apply the $19 U.S. base price and choose the tax category, territories, availability date, release option, age rating, content-rights answers, and export-compliance answers
- [ ] Complete Digital Services Act trader-status information for applicable EU distribution
- [ ] Answer the regulated-medical-device question as **No** unless the product scope changes
- [ ] Leave the custom EULA field empty so Apple's Standard EULA applies
- [ ] Deploy and verify the SwiftData schema in the production CloudKit container
- [x] Push Notifications enabled for the App ID; managed profiles refreshed and the exported App Store build verified with production `aps-environment`
- [x] Version 1.2 (build 7) archived, exported with App Store distribution signing, and locally validated
- [ ] Upload version 1.2 (build 7) and attach the processed build to the correct App Store version record
- [ ] Test Files and private iCloud sync on two signed physical devices
- [x] Build settings exclude untested Apple-silicon Mac and Apple Vision Pro compatibility
- [ ] Confirm Mac and Vision Pro availability are disabled in App Store Connect
- [x] Recaptured the required screenshot sets against the final 1.2 UI with fictional data
- [ ] Activate the website App Store CTA with `https://apps.apple.com/app/id6808849656` when the listing is public
- [ ] Confirm Yaprflow ($29), Screencast.to ($29), and PaperDrawer ($19) are in the same App Store Connect account, then create the discounted multi-app bundle after every member is paid and Ready for Distribution; keep its price at least $29 and below the $77 standalone total
