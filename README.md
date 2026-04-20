# itsfreddyrb/homebrew-awsanalyze

Homebrew tap for [AWSAnalyze](https://awsanalyze.app) — a native macOS app
that scans AWS accounts and draws your infrastructure as an interactive graph.

## Install

```bash
brew install --cask itsfreddyrb/awsanalyze/awsanalyze
```

That's it. The cask handles the download, SHA256 verification, Gatekeeper
quarantine flag, and installs `AWSAnalyze.app` into `/Applications`.

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

This tap tracks [awsanalyze releases](https://github.com/itsfreddyrb/awsanalyze/releases).
Each release updates the `version` + `sha256` fields in
[`Casks/awsanalyze.rb`](Casks/awsanalyze.rb). The `livecheck` block points
Homebrew's update scanner at the GitHub Releases API so `brew livecheck`
picks up new versions automatically.
