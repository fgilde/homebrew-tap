# Homebrew formula for QuickRun. Served from the project site, so no tap is needed:
#   brew install https://fgilde.github.io/QuickRun/quickrun.rb
#
# If a fgilde/homebrew-tap repository exists, copying this file into its Formula/
# directory also makes "brew install fgilde/tap/quickrun" work, with upgrade tracking.
class Quickrun < Formula
  desc "Run any git repository with one click"
  homepage "https://fgilde.github.io/QuickRun"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.2.0/quickrun-osx-arm64.tar.gz"
      sha256 "2f7d00f66eade26eba039bddca0ed9554969b8c4fad4e0a9142d91b70a71b7c0"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.2.0/quickrun-osx-x64.tar.gz"
      sha256 "3d70744898d2c648a3ce4d03248218af2295086aacf785cea9c6ebab2384d4ec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.2.0/quickrun-linux-arm64.tar.gz"
      sha256 "737f5cbc18dcd1c4c75f124fa686f026b44beb98a82b9c22517630f309dd898f"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.2.0/quickrun-linux-x64.tar.gz"
      sha256 "a63adb14a378e2b4d6a33d0c71705d680eb75bd1d142c18ca7c5979d507e8f52"
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
