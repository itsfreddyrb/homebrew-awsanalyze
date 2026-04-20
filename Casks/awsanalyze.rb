cask "awsanalyze" do
  version "1.0.1"
  sha256 "738aec614939bcecc5c25dd79f81f2e719469e42ced0971792f4e35c040df3c1"

  url "https://github.com/itsfreddyrb/awsanalyze-releases/releases/download/v#{version}/AWSAnalyze.dmg",
      verified: "github.com/itsfreddyrb/awsanalyze-releases/"
  name "AWSAnalyze"
  desc "macOS app that scans AWS infrastructure and renders it as an interactive graph"
  homepage "https://awsanalyze.app/"

  # Apple Silicon only (current build is arm64).
  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "AWSAnalyze.app"

  # Strip Gatekeeper's quarantine flag so the signed-but-not-yet-notarized
  # build doesn't hit the "damaged / cannot be opened" wall on first launch.
  # The app IS codesigned with a Developer ID certificate — we're just
  # skipping Apple's notarization scan for now. This will be removed once
  # the release pipeline emits notarized builds (roadmap item #2).
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/AWSAnalyze.app"],
                   sudo: false
  end

  # Uninstall cleanup — Keychain entries, SwiftData store, OAuth tokens.
  zap trash: [
    "~/Library/Containers/com.awsanalyze.app",
    "~/Library/Application Support/AWSAnalyze",
    "~/Library/Application Support/default.store",
    "~/Library/Caches/com.awsanalyze.app",
    "~/Library/Preferences/com.awsanalyze.app.plist",
    "~/Library/Saved Application State/com.awsanalyze.app.savedState",
  ]
end
