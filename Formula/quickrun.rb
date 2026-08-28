# Homebrew formula for QuickRun. Served from the project site, so no tap is needed:
#   brew install https://fgilde.github.io/QuickRun/quickrun.rb
#
# If a fgilde/homebrew-tap repository exists, copying this file into its Formula/
# directory also makes "brew install fgilde/tap/quickrun" work, with upgrade tracking.
class Quickrun < Formula
  desc "Run any git repository with one click"
  homepage "https://fgilde.github.io/QuickRun"
  version "0.9.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.2/quickrun-osx-arm64.tar.gz"
      sha256 "08c1efd966e20bbcdb41537be6f436e8c4b6956de36a7591c3a9cb8aafa7e6af"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.2/quickrun-osx-x64.tar.gz"
      sha256 "4d2a70e7ecb598454c2d88bc4c90c7e4270509f4a172fcccf930c2b8ab9c9729"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.2/quickrun-linux-arm64.tar.gz"
      sha256 "d8abd64ae456fb134944f1474aeeb485e59f9417baacad44cbd95c13a80a70bb"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.2/quickrun-linux-x64.tar.gz"
      sha256 "e381f0130dfc8690dc84e5fbc579689dab4c43ec5d86668faa11b6fc42b1a40d"
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
