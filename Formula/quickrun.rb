# Homebrew formula for QuickRun. Served from the project site, so no tap is needed:
#   brew install https://fgilde.github.io/QuickRun/quickrun.rb
#
# If a fgilde/homebrew-tap repository exists, copying this file into its Formula/
# directory also makes "brew install fgilde/tap/quickrun" work, with upgrade tracking.
class Quickrun < Formula
  desc "Run any git repository with one click"
  homepage "https://fgilde.github.io/QuickRun"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.1.0/quickrun-osx-arm64.tar.gz"
      sha256 "cfdeafeacf30c41ac872fd0332fd2e117f679deda4a07df4abf57c8d8b06e072"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.1.0/quickrun-osx-x64.tar.gz"
      sha256 "91fa9885ed719e9ae946e86c801f02c91c4e91a85120dc2005e6daf348f9004e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.1.0/quickrun-linux-arm64.tar.gz"
      sha256 "1305fffd5cb8446208bb24ff949b8a193d32cd72642e81adffe65998a4080ddb"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.1.0/quickrun-linux-x64.tar.gz"
      sha256 "11e0a7dcc081c801aa97418ade62ad2edc13cd9922c46bde83bc5ea52c7db4f5"
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
