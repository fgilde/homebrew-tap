# Homebrew formula for QuickRun. Served from the project site, so no tap is needed:
#   brew install https://quickrun.org/quickrun.rb
#
# If a fgilde/homebrew-tap repository exists, copying this file into its Formula/
# directory also makes "brew install fgilde/tap/quickrun" work, with upgrade tracking.
class Quickrun < Formula
  desc "Run any git repository with one click"
  homepage "https://quickrun.org"
  version "0.9.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.12/quickrun-osx-arm64.tar.gz"
      sha256 "9107551840059637a9b8c26fb116068eeb0dfd66c99cece5b2d222a3078152c3"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.12/quickrun-osx-x64.tar.gz"
      sha256 "2634a5c41c92735e75e0a51f1d1b9c0b2f6fd196d7833c099a009c40e0ee29be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.12/quickrun-linux-arm64.tar.gz"
      sha256 "32166126aff8e0ca4ff9949c421acc7f3147581f2a344a6a8e0e817313b5e650"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.12/quickrun-linux-x64.tar.gz"
      sha256 "38f8bd160300d352a3d5dc940ab7365250ddde21f2ecd8bef5abecc67f300a5f"
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
