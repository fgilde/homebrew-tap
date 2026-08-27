# Homebrew formula for QuickRun. Served from the project site, so no tap is needed:
#   brew install https://fgilde.github.io/QuickRun/quickrun.rb
#
# If a fgilde/homebrew-tap repository exists, copying this file into its Formula/
# directory also makes "brew install fgilde/tap/quickrun" work, with upgrade tracking.
class Quickrun < Formula
  desc "Run any git repository with one click"
  homepage "https://fgilde.github.io/QuickRun"
  version "0.8.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.8.4/quickrun-osx-arm64.tar.gz"
      sha256 "fa1f35fd08704e9255ba787da6c7e7d641e4951e723a8a0842f0495b4643c819"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.8.4/quickrun-osx-x64.tar.gz"
      sha256 "27d288b532d24face06fefc621e0ca606181215627f8244c7133eb584acad495"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.8.4/quickrun-linux-arm64.tar.gz"
      sha256 "31a9bd935994c3b45b19d7d536999d98d03af284db9ea5a1de728a7681ad3dde"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.8.4/quickrun-linux-x64.tar.gz"
      sha256 "4705f316d8867f3f2836ef6b1f55ddb8a3e752aff487498d844d16effe8a35f7"
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
