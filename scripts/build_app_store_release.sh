#!/bin/sh

set -eu

script_directory=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
repository_root=$(CDPATH= cd -- "$script_directory/.." && pwd)
release_timestamp=$(date -u +%Y%m%d-%H%M%S)
release_root=${PAPERDRAWER_RELEASE_ROOT:-"$repository_root/.build/app-store-$release_timestamp"}
archive_path="$release_root/PaperDrawer.xcarchive"
export_path="$release_root/export"

mkdir -p "$release_root"

xcodebuild \
  -project "$repository_root/PaperDrawer.xcodeproj" \
  -scheme PaperDrawer \
  -configuration Release \
  -destination 'generic/platform=iOS' \
  -archivePath "$archive_path" \
  -allowProvisioningUpdates \
  clean archive

codesign --verify --deep --strict --verbose=2 \
  "$archive_path/Products/Applications/PaperDrawer.app"

xcodebuild \
  -exportArchive \
  -archivePath "$archive_path" \
  -exportPath "$export_path" \
  -exportOptionsPlist "$repository_root/app-store/ExportOptions.plist" \
  -allowProvisioningUpdates

printf 'App Store archive: %s\n' "$archive_path"
printf 'Exported release: %s\n' "$export_path"
