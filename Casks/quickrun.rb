cask "quickrun" do
  arch arm: "arm64", intel: "x64"

  version "0.8.0"
  sha256 arm:   "436e0e46d95a74b0c21f16e96a11df7db063537bb42efe7d8bb6eee39e6adbbb",
         intel: "3a9f2936be80ec3518e8591bcf1d944c8cb0e18d0d9662f859f8449c7240baa1"

  url "https://github.com/fgilde/QuickRun/releases/download/v0.8.0/QuickRun-osx-#{arch}.app.zip",
      verified: "github.com/fgilde/QuickRun/"
  name "QuickRun"
  desc "Run any git repository with one click"
  homepage "https://fgilde.github.io/QuickRun"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"

  app "QuickRun.app"
  # The command line and the app are one install: this is the same binary the bundle runs.
  binary "#{appdir}/QuickRun.app/Contents/MacOS/quickrun"

  postflight do
    # The binaries are unsigned, so Gatekeeper would refuse the first launch with "damaged".
    # Removing the download flag from a bundle the user explicitly asked Homebrew to install is
    # what every unsigned cask does, and it is visible here rather than hidden in a support script.
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/QuickRun.app"],
                   sudo: false

    # Tells auto-update that Homebrew owns this install, so QuickRun reports new versions rather
    # than replacing a file Homebrew is tracking.
    support = Pathname.new("#{Dir.home}/Library/Application Support/QuickRun")
    support.mkpath
    (support/"install-source").write("brew\n")
  end

  zap trash: [
    "~/Library/Application Support/QuickRun",
    "~/Library/LaunchAgents/org.fgilde.quickrun.plist",
  ]
end
