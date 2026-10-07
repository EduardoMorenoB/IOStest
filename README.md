# IOStest

A minimal SwiftUI iOS app that starts a Live Activity and displays **Hello World** in the Dynamic Island and on the Lock Screen.

## Build with GitHub Actions

The **iOS Build** workflow runs on GitHub's macOS runner for pushes to `main`, pull requests targeting `main`, or when started manually from the Actions tab. It generates the Xcode project, archives for iOS devices, packages the app as an `.ipa`, and uploads it as a downloadable artifact. The IPA is unsigned because no Apple signing credentials are configured in GitHub; it is a build artifact and cannot be installed on an iPhone until it is signed.

## Open and run locally

This repository uses [XcodeGen](https://github.com/yonaskolb/XcodeGen) to generate the Xcode project from `project.yml`.

1. On a Mac with Xcode installed, install XcodeGen (`brew install xcodegen`).
2. From this folder, run `xcodegen generate` and open `IOStest.xcodeproj`.
3. Select your Apple development team for both targets if Xcode requests signing.
4. Run on an iPhone that supports Dynamic Island. Open the app and tap **Show on Dynamic Island**.

Live Activities require iOS 16.2 or later and must be enabled for the app. Installing on a physical iPhone requires an Apple Developer signing setup and a signed distribution build.
