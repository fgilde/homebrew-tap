# Homebrew formula for QuickRun. Served from the project site, so no tap is needed:
#   brew install https://quickrun.org/quickrun.rb
#
# If a fgilde/homebrew-tap repository exists, copying this file into its Formula/
# directory also makes "brew install fgilde/tap/quickrun" work, with upgrade tracking.
class Quickrun < Formula
  desc "Run any git repository with one click"
  homepage "https://quickrun.org"
  version "0.9.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.7/quickrun-osx-arm64.tar.gz"
      sha256 "2c4cc56ed36d51e1e359f1e690e7951ac7ba6e093b037d976e0d1aea2ee326cd"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.7/quickrun-osx-x64.tar.gz"
      sha256 "d95f972ab3c3357afafacd5c03bde0159e5617e261aa450836c366564f9cc5f8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.7/quickrun-linux-arm64.tar.gz"
      sha256 "76d6b801931770e2737fd20fbc0e0d833dba43617306eafd983f19110f166351"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.7/quickrun-linux-x64.tar.gz"
      sha256 "effbff5e0deaf310a06f5f553fda87b72d7aa2d57278eda82825281ca156ad99"
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
