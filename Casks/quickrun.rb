cask "quickrun" do
  arch arm: "arm64", intel: "x64"

  version "0.9.13"
  sha256 arm:   "8cc355e93e8f6e4fc8b0eca145c029e1b3b70b493e2cad8110f5c7db81825ff1",
         intel: "7d20476f35244938259a73eb9efc8ce9720debe49993049c5f7beaec7d387b52"

  url "https://github.com/fgilde/QuickRun/releases/download/v0.9.13/QuickRun-osx-#{arch}.app.zip",
      verified: "github.com/fgilde/QuickRun/"
  name "QuickRun"
  desc "Run any git repository with one click"
  homepage "https://quickrun.org"

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
