# Homebrew formula for QuickRun. Served from the project site, so no tap is needed:
#   brew install https://fgilde.github.io/QuickRun/quickrun.rb
#
# If a fgilde/homebrew-tap repository exists, copying this file into its Formula/
# directory also makes "brew install fgilde/tap/quickrun" work, with upgrade tracking.
class Quickrun < Formula
  desc "Run any git repository with one click"
  homepage "https://fgilde.github.io/QuickRun"
  version "0.7.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.7.12/quickrun-osx-arm64.tar.gz"
      sha256 "fa681611b107cf3d09d4d996c662b5860a50f990b422609422bcb4a486e3a55d"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.7.12/quickrun-osx-x64.tar.gz"
      sha256 "1d2c80d4f0ffb75ad357c0b0fef2115e833159134d178328410169687a06294e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.7.12/quickrun-linux-arm64.tar.gz"
      sha256 "ee82ef54937948f1c47864d13b09d11f0b5c6db939dd2e82f428f5b876ca7c1a"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.7.12/quickrun-linux-x64.tar.gz"
      sha256 "4cf789a77c3e970d1ff8e5919185c7ca227499408967ca3f6f09b6acbdcf6c61"
    end
  end

  def install
    bin.install "quickrun"
    # Tells auto-update that Homebrew owns this binary, so QuickRun reports new
    # versions instead of overwriting itself.
    (var/"quickrun").mkpath
    (etc/"quickrun/install-source").write("brew\n")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/quickrun --version")
  end
end
