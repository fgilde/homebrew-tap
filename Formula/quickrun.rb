# Homebrew formula for QuickRun. Served from the project site, so no tap is needed:
#   brew install https://fgilde.github.io/QuickRun/quickrun.rb
#
# If a fgilde/homebrew-tap repository exists, copying this file into its Formula/
# directory also makes "brew install fgilde/tap/quickrun" work, with upgrade tracking.
class Quickrun < Formula
  desc "Run any git repository with one click"
  homepage "https://fgilde.github.io/QuickRun"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.8.0/quickrun-osx-arm64.tar.gz"
      sha256 "6c790290fb23388c7b2bd39ca0753b993188fe4954ee8da92a4bf7ac15b1ef40"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.8.0/quickrun-osx-x64.tar.gz"
      sha256 "f265e6eace9d5f6c924b3eaec82d5c21b0ac559035f38afa35c5798c81102dda"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.8.0/quickrun-linux-arm64.tar.gz"
      sha256 "497bc093c8f5693d5d6d9c51f471a0a43c4863091111889b76ea2710381121a5"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.8.0/quickrun-linux-x64.tar.gz"
      sha256 "77f504e4d72fa2ff3d02c5cdd7e74c523190ffc23bf9d7074efb1211cf47df22"
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
