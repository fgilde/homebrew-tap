# Homebrew formula for QuickRun. Served from the project site, so no tap is needed:
#   brew install https://quickrun.org/quickrun.rb
#
# If a fgilde/homebrew-tap repository exists, copying this file into its Formula/
# directory also makes "brew install fgilde/tap/quickrun" work, with upgrade tracking.
class Quickrun < Formula
  desc "Run any git repository with one click"
  homepage "https://quickrun.org"
  version "0.9.14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.14/quickrun-osx-arm64.tar.gz"
      sha256 "eaebc05dbf00547f5b0e0a1b65d65d62485f75b460e5d06f1638c7bb86499498"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.14/quickrun-osx-x64.tar.gz"
      sha256 "8d22a0797e16c5f9b3c78c2c43175d76df945d6700ecc580b5198980dda8dcef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.14/quickrun-linux-arm64.tar.gz"
      sha256 "591b34b3341e360bb3cfbded4506f603ab4d459932de6db196a08ef944194415"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.14/quickrun-linux-x64.tar.gz"
      sha256 "e7059e7b9b9eb9151283e40e4686add99836e1c54398441f00cfbdc593dd6a76"
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
