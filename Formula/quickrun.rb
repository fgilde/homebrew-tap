# Homebrew formula for QuickRun. Served from the project site, so no tap is needed:
#   brew install https://fgilde.github.io/QuickRun/quickrun.rb
#
# If a fgilde/homebrew-tap repository exists, copying this file into its Formula/
# directory also makes "brew install fgilde/tap/quickrun" work, with upgrade tracking.
class Quickrun < Formula
  desc "Run any git repository with one click"
  homepage "https://fgilde.github.io/QuickRun"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.4.0/quickrun-osx-arm64.tar.gz"
      sha256 "9a91c43da011e4e278520807f7629661500b5b129b9d64a596f7ef83faeca244"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.4.0/quickrun-osx-x64.tar.gz"
      sha256 "9e76f9888bef4293032527158e5c91dff199e9329730b6de2a53e8c9b46b2253"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.4.0/quickrun-linux-arm64.tar.gz"
      sha256 "3a1e2835413f98c3559c655c194f23bae95bc12d64c1c70bf3e85f0a66258926"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.4.0/quickrun-linux-x64.tar.gz"
      sha256 "0f0e40fe8de938b067d884be8b34ba5e9815324f34c1bb0b651c73250f010cfe"
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
