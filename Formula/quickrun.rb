# Homebrew formula for QuickRun. Served from the project site, so no tap is needed:
#   brew install https://fgilde.github.io/QuickRun/quickrun.rb
#
# If a fgilde/homebrew-tap repository exists, copying this file into its Formula/
# directory also makes "brew install fgilde/tap/quickrun" work, with upgrade tracking.
class Quickrun < Formula
  desc "Run any git repository with one click"
  homepage "https://fgilde.github.io/QuickRun"
  version "0.9.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.1/quickrun-osx-arm64.tar.gz"
      sha256 "10363fbb13ffeb8bc257153367c8d374c61af086bf3b6e95b3dc941a0f654365"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.1/quickrun-osx-x64.tar.gz"
      sha256 "0a4e41a5faf356ea31c00352fa087765d22e041afb975fd7811a36a803202205"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.1/quickrun-linux-arm64.tar.gz"
      sha256 "97fe977f61952bcce9efc88550695135ef78597505ce263b5c97078529779e71"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.1/quickrun-linux-x64.tar.gz"
      sha256 "97595ebc45dcd08625f5f00fa60f52d68475b42f6338de3536ed216b7eb6810d"
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
