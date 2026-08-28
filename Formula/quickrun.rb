# Homebrew formula for QuickRun. Served from the project site, so no tap is needed:
#   brew install https://fgilde.github.io/QuickRun/quickrun.rb
#
# If a fgilde/homebrew-tap repository exists, copying this file into its Formula/
# directory also makes "brew install fgilde/tap/quickrun" work, with upgrade tracking.
class Quickrun < Formula
  desc "Run any git repository with one click"
  homepage "https://fgilde.github.io/QuickRun"
  version "0.8.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.8.8/quickrun-osx-arm64.tar.gz"
      sha256 "e9cb11ee8e3b690115f3286f5e945ab47953db9977fa9bcfa336426010d1ac60"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.8.8/quickrun-osx-x64.tar.gz"
      sha256 "7e917a1c55ef35f370638e5f51d4cd8b1b1be966aac60e171343441163845839"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.8.8/quickrun-linux-arm64.tar.gz"
      sha256 "ae4cae35c3e8653168e80501d91b7179b20b9d413a113ff417fb0c5b4fbdc21d"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.8.8/quickrun-linux-x64.tar.gz"
      sha256 "b37cd75eb8353258e139d5d021654d7a718e309ddd71937b11ca6fe5816eebdc"
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
