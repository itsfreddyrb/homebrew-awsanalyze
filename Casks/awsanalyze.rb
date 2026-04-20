cask "awsanalyze" do
  version "1.0.0"
  sha256 "6318b19fa0a9c0a94c6b7f4b6bf2b1284720a6064a186b723740d75be627e723"

  url "https://github.com/itsfreddyrb/awsanalyze/releases/download/v#{version}/AWSAnalyze.dmg",
      verified: "github.com/itsfreddyrb/awsanalyze/"
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
