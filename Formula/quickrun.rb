# Homebrew formula for QuickRun. Served from the project site, so no tap is needed:
#   brew install https://quickrun.org/quickrun.rb
#
# If a fgilde/homebrew-tap repository exists, copying this file into its Formula/
# directory also makes "brew install fgilde/tap/quickrun" work, with upgrade tracking.
class Quickrun < Formula
  desc "Run any git repository with one click"
  homepage "https://quickrun.org"
  version "0.9.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.9/quickrun-osx-arm64.tar.gz"
      sha256 "85ca6920b1ca2a4518c2d3f426e04969fdecbcea9619fb8d066d1eede0822016"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.9/quickrun-osx-x64.tar.gz"
      sha256 "55b7628fa41fc4995c354fe7beefeea56e4abe6bb4db87b31bfd02ded2cd81b8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.9/quickrun-linux-arm64.tar.gz"
      sha256 "c7e1dd7d96f9934b4d7cf91e0e29d81934330cdd51eb6c2a056695bc0918ee6e"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.9/quickrun-linux-x64.tar.gz"
      sha256 "f677ff9f213caf6b9b59c3156f824660003d9f0f2a297b7b117fc838c350186e"
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
