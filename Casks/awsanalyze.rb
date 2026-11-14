cask "awsanalyze" do
  version "1.1.5"
  sha256 "f82addadad958d0da2c1b2b12d952e132caf05447379c829b5ec1c4f356464d2"

  url "https://github.com/itsfreddyrb/awsanalyze-releases/releases/download/v#{version}/AWSAnalyze.dmg",
      verified: "github.com/itsfreddyrb/awsanalyze-releases/"
  name "AWSAnalyze"
  desc "Scan AWS infrastructure and view it as an interactive architecture map"
  homepage "https://awsanalyze.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Apple Silicon only (current build is arm64).
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "AWSAnalyze.app"

  # Uninstall cleanup: app data, SwiftData store, preferences.
  zap trash: [
    "~/Library/Application Support/AWSAnalyze",
    "~/Library/Application Support/default.store",
    "~/Library/Caches/com.awsanalyze.app",
    "~/Library/Containers/com.awsanalyze.app",
    "~/Library/Preferences/com.awsanalyze.app.plist",
    "~/Library/Saved Application State/com.awsanalyze.app.savedState",
  ]
end
