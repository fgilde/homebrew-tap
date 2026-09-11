# Homebrew formula for QuickRun. Served from the project site, so no tap is needed:
#   brew install https://quickrun.org/quickrun.rb
#
# If a fgilde/homebrew-tap repository exists, copying this file into its Formula/
# directory also makes "brew install fgilde/tap/quickrun" work, with upgrade tracking.
class Quickrun < Formula
  desc "Run any git repository with one click"
  homepage "https://quickrun.org"
  version "0.9.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.13/quickrun-osx-arm64.tar.gz"
      sha256 "4b1dadb4ae9554daac71228f72ba0b2b8384c4d08f97b981caacf37c7efc2070"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.13/quickrun-osx-x64.tar.gz"
      sha256 "0744f5c2e32360f54ce109f41504c363e65a840693f1c0cd9c20de5b59e121b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.13/quickrun-linux-arm64.tar.gz"
      sha256 "a458341f8a43295d81b747b8c0a53c12cddfdc4b8286d6f59c2e9292feb65bb3"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.13/quickrun-linux-x64.tar.gz"
      sha256 "f6cc2c023e8931950d7e5bd29d946574ba7dc129c5c6ff8f80cc2fd6ef18f482"
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
