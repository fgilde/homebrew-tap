# Homebrew formula for QuickRun. Served from the project site, so no tap is needed:
#   brew install https://quickrun.org/quickrun.rb
#
# If a fgilde/homebrew-tap repository exists, copying this file into its Formula/
# directory also makes "brew install fgilde/tap/quickrun" work, with upgrade tracking.
class Quickrun < Formula
  desc "Run any git repository with one click"
  homepage "https://quickrun.org"
  version "0.9.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.6/quickrun-osx-arm64.tar.gz"
      sha256 "fa556ef6c0e669bb8dfec384cfaeeccbc58cdc3dd96ea0de496e9ce407e3015b"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.6/quickrun-osx-x64.tar.gz"
      sha256 "70a26613c99b239ad078d37f7c8d186a9108a65503afb0e9c799fced1836db7b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.6/quickrun-linux-arm64.tar.gz"
      sha256 "bd2b49c95991d46176bf010d603bbd139aad33456870195abbfc691ea5e911a7"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.6/quickrun-linux-x64.tar.gz"
      sha256 "3e4c28841e8b7edef352e436766d4defdb916f8301036cf1c3210a8594dbd9c7"
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
