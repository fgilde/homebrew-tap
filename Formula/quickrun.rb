# Homebrew formula for QuickRun. Served from the project site, so no tap is needed:
#   brew install https://fgilde.github.io/QuickRun/quickrun.rb
#
# If a fgilde/homebrew-tap repository exists, copying this file into its Formula/
# directory also makes "brew install fgilde/tap/quickrun" work, with upgrade tracking.
class Quickrun < Formula
  desc "Run any git repository with one click"
  homepage "https://fgilde.github.io/QuickRun"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.5.1/quickrun-osx-arm64.tar.gz"
      sha256 "0d22ac34113e7b6ad41b13559f9d17b1bb645f6c03ffebd2b053445113d93132"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.5.1/quickrun-osx-x64.tar.gz"
      sha256 "d06d7abb427a1c1b9e79e8a3f784cc3e33a7c53671c0bb856b497c8fdc7a31a9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.5.1/quickrun-linux-arm64.tar.gz"
      sha256 "02ddc8215f12a817ef6a0a76d70a5b053a48722116aaf3bad7bb126f11849e2f"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.5.1/quickrun-linux-x64.tar.gz"
      sha256 "bd4456d53eb8082064f12daf307325b98ff3f4b8a51d85b19f347fd9a5e18c86"
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
