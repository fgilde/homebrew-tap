# Homebrew formula for QuickRun. Served from the project site, so no tap is needed:
#   brew install https://quickrun.org/quickrun.rb
#
# If a fgilde/homebrew-tap repository exists, copying this file into its Formula/
# directory also makes "brew install fgilde/tap/quickrun" work, with upgrade tracking.
class Quickrun < Formula
  desc "Run any git repository with one click"
  homepage "https://quickrun.org"
  version "0.9.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.8/quickrun-osx-arm64.tar.gz"
      sha256 "a8ec47470714c6322117393385e8236e06775f4553becde9a190bed00762f967"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.8/quickrun-osx-x64.tar.gz"
      sha256 "ed8fb135a0d10fbb89f4c70dcbc93dfe44085a005cb50058c3304e94338c4697"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.8/quickrun-linux-arm64.tar.gz"
      sha256 "9344ae0eb5babe24f12339fa7062ea322c360a806c4d9c0588a6508448116258"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.8/quickrun-linux-x64.tar.gz"
      sha256 "ab42882b82fc834f980b6da4dfdf53ecd1fbd12ced8cd178327aa14b26c03cb7"
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
