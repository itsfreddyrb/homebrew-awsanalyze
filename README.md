# itsfreddyrb/homebrew-awsanalyze

Homebrew tap for [AWSAnalyze](https://awsanalyze.app) — a native macOS app
that scans AWS accounts and draws your infrastructure as an interactive graph.

## Install

```bash
brew install --cask itsfreddyrb/awsanalyze/awsanalyze
```

That's it. The cask downloads the DMG, verifies its SHA256 and installs
`AWSAnalyze.app` into `/Applications`. The app is signed and notarized by
Apple, so it opens without Gatekeeper warnings.

Recent Homebrew versions refuse casks from third-party taps until you trust
the tap. If you see "Refusing to load cask ... from untrusted tap", run:

```bash
brew trust itsfreddyrb/awsanalyze
```

and install again.

Prefer a plain download? Get the DMG at https://awsanalyze.app.

## Upgrade

```bash
brew upgrade --cask awsanalyze
```

## Uninstall

```bash
brew uninstall --cask awsanalyze        # removes the app
brew uninstall --cask --zap awsanalyze  # removes the app + all app data
```

## Supported platforms

- macOS 14 (Sonoma) and later
- Apple Silicon only (current build is arm64)

Windows and Linux are not supported — AWSAnalyze is written in Swift on top
of AppKit/SwiftUI.

## Versioning

This tap tracks [awsanalyze releases](https://github.com/itsfreddyrb/awsanalyze-releases/releases).
Each release updates the `version` + `sha256` fields in
[`Casks/awsanalyze.rb`](Casks/awsanalyze.rb). The `livecheck` block points
Homebrew's update scanner at the GitHub Releases API so `brew livecheck`
picks up new versions automatically.
