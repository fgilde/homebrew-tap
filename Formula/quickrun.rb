# Homebrew formula for QuickRun. Served from the project site, so no tap is needed:
#   brew install https://quickrun.org/quickrun.rb
#
# If a fgilde/homebrew-tap repository exists, copying this file into its Formula/
# directory also makes "brew install fgilde/tap/quickrun" work, with upgrade tracking.
class Quickrun < Formula
  desc "Run any git repository with one click"
  homepage "https://quickrun.org"
  version "0.9.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.4/quickrun-osx-arm64.tar.gz"
      sha256 "c11ef3671872e76f66e2e8264654371ed5e4d5ea2491ed4785526d94dd331be9"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.4/quickrun-osx-x64.tar.gz"
      sha256 "25491b0437eb1b92d7bff67046d0d8abf4d3e3557b03cd90cda222fa9961a042"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.4/quickrun-linux-arm64.tar.gz"
      sha256 "52961307179b589c7f47c9e3369f5c19a9fe38a0fa6f52b2309ea38af585aa62"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.4/quickrun-linux-x64.tar.gz"
      sha256 "4c6939e4f51ad01185ebff8e9e5a831c3cf550ba81d31e2ddf493fd1373fc4db"
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
