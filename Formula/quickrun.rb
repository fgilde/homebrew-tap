# Homebrew formula for QuickRun. Served from the project site, so no tap is needed:
#   brew install https://fgilde.github.io/QuickRun/quickrun.rb
#
# If a fgilde/homebrew-tap repository exists, copying this file into its Formula/
# directory also makes "brew install fgilde/tap/quickrun" work, with upgrade tracking.
class Quickrun < Formula
  desc "Run any git repository with one click"
  homepage "https://fgilde.github.io/QuickRun"
  version "0.8.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.8.3/quickrun-osx-arm64.tar.gz"
      sha256 "978935cf34a0abe4bc46fb4dedeb9ebc6016de02c25f58308213b445722f8373"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.8.3/quickrun-osx-x64.tar.gz"
      sha256 "8b33890ed75658b4fc15d86f1fa7d4fe1b35aaa41402e30627a717c5bd782ef7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.8.3/quickrun-linux-arm64.tar.gz"
      sha256 "8a543039369ec4dadcdbc1af01ebf85b9b53e05acdda1de286c7243fe78e21c7"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.8.3/quickrun-linux-x64.tar.gz"
      sha256 "e9afe8f103bfcca06271fd4938fb2cf784b8d449824aaa39cbd6dd86b8fa2dae"
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
