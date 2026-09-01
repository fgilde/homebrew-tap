# Homebrew formula for QuickRun. Served from the project site, so no tap is needed:
#   brew install https://quickrun.org/quickrun.rb
#
# If a fgilde/homebrew-tap repository exists, copying this file into its Formula/
# directory also makes "brew install fgilde/tap/quickrun" work, with upgrade tracking.
class Quickrun < Formula
  desc "Run any git repository with one click"
  homepage "https://quickrun.org"
  version "0.9.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.5/quickrun-osx-arm64.tar.gz"
      sha256 "7d400e07cff9f5014fce5dc9b48334d160eb4afa35d3d3fdba51894a1d29b782"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.5/quickrun-osx-x64.tar.gz"
      sha256 "6ed923febec703706b95ffc16cd217b1a86413a3e7cbae2bc90a3908bb4d10a1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.5/quickrun-linux-arm64.tar.gz"
      sha256 "bdea441b587222f72963a844002c0b4f483e780ebf95dadfcc74f8816ea165be"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.5/quickrun-linux-x64.tar.gz"
      sha256 "c2cb86e440248a1cb0fa66568eec8337a920b1c2ac910448c343eea7d1f27b8d"
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
