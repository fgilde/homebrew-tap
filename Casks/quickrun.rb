cask "quickrun" do
  arch arm: "arm64", intel: "x64"

  version "0.9.6"
  sha256 arm:   "d744d313e1cfaa7b2ed27e1e613439cd03b22fa85eb0eabc27cf08e3a6a98d5c",
         intel: "86c48f90a97e8e8719640115b7e5df96897550f1b4723c9f4c87bc616e217388"

  url "https://github.com/fgilde/QuickRun/releases/download/v0.9.6/QuickRun-osx-#{arch}.app.zip",
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
