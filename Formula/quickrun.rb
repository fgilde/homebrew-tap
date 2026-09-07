# Homebrew formula for QuickRun. Served from the project site, so no tap is needed:
#   brew install https://quickrun.org/quickrun.rb
#
# If a fgilde/homebrew-tap repository exists, copying this file into its Formula/
# directory also makes "brew install fgilde/tap/quickrun" work, with upgrade tracking.
class Quickrun < Formula
  desc "Run any git repository with one click"
  homepage "https://quickrun.org"
  version "0.9.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.11/quickrun-osx-arm64.tar.gz"
      sha256 "1b0422ecfdc09327434ac5c5a77475695f3241c85ef00c0c9be9b565379dee95"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.11/quickrun-osx-x64.tar.gz"
      sha256 "db5e960b3c8d15edda942f5e2ca04a9483cbea22e24a7ccbb3e5dc8a03db633b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.11/quickrun-linux-arm64.tar.gz"
      sha256 "268dd723931fc9043f0271f599446b5c885d4df3519592cb24c2d149ecf45eff"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.11/quickrun-linux-x64.tar.gz"
      sha256 "b6f78bbc643bb62a7a46577eb290e36aa79162b467c0b018127b4921c088d63c"
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
