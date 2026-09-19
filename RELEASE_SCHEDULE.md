# Release schedule

PaperDrawer follows a weekly release-readiness cadence without publishing empty calendar releases.

## Automated schedule

- Every pull request and push to `main` builds Debug and Release simulator apps and runs Xcode static analysis.
- CodeQL scans Swift changes on pull requests, pushes to `main`, and every Monday at 13:37 UTC.
- Release readiness runs every Monday at 14:17 UTC and retains an unsigned simulator build for 14 days.
- Dependabot checks the GitHub Actions supply chain every Monday and opens grouped update pull requests.

The scheduled build is evidence that the current source is releasable. It is not an App Store binary and must never be distributed as one.

## Publishing an update

1. Prepare the change on a branch and update `MARKETING_VERSION` and `CURRENT_PROJECT_VERSION` when a release is warranted.
2. Merge the pull request only after the required `iOS app` and `CodeQL` checks pass.
3. On the trusted release Mac, run `scripts/build_app_store_release.sh` and inspect the signed archive and exported IPA.
4. Upload the verified build through Xcode or Transporter and complete the App Store Connect release notes and review steps.
5. After approval, create and push a tag matching the marketing version, such as `v1.2`. The tag creates a source-only GitHub release with generated notes.

Signed App Store artifacts, signing certificates, provisioning profiles, and App Store Connect credentials must not be stored in GitHub Actions or attached to GitHub Releases. This matches the local signed-release boundary used by the other apps in the portfolio.
