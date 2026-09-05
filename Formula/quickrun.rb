# Homebrew formula for QuickRun. Served from the project site, so no tap is needed:
#   brew install https://quickrun.org/quickrun.rb
#
# If a fgilde/homebrew-tap repository exists, copying this file into its Formula/
# directory also makes "brew install fgilde/tap/quickrun" work, with upgrade tracking.
class Quickrun < Formula
  desc "Run any git repository with one click"
  homepage "https://quickrun.org"
  version "0.9.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.10/quickrun-osx-arm64.tar.gz"
      sha256 "3169d6155246d88a97b7a0c553c9b55aa58d4cd0e4c0f0c902743e7f0554a516"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.10/quickrun-osx-x64.tar.gz"
      sha256 "c63992276c6d32e92e837d0226eb358c39d7918b84f764115e7798c8cb6e7bfc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.10/quickrun-linux-arm64.tar.gz"
      sha256 "2f381751bd024a4c3f7d6ac2929982d4cbcd9a01f36046433b97ec9c4c6dd186"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.10/quickrun-linux-x64.tar.gz"
      sha256 "617380917a54bf7a4bbe27ed4acfb010f6f7cd5275471d69500fddaab1c7e848"
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
