# Homebrew formula for QuickRun. Served from the project site, so no tap is needed:
#   brew install https://fgilde.github.io/QuickRun/quickrun.rb
#
# If a fgilde/homebrew-tap repository exists, copying this file into its Formula/
# directory also makes "brew install fgilde/tap/quickrun" work, with upgrade tracking.
class Quickrun < Formula
  desc "Run any git repository with one click"
  homepage "https://fgilde.github.io/QuickRun"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.5.2/quickrun-osx-arm64.tar.gz"
      sha256 "1719fbb36283d75a8f71bb5bea0adffd6f756411ef96e158c3a5ecbcd5335c97"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.5.2/quickrun-osx-x64.tar.gz"
      sha256 "cab19c52a95bc431100395ad725aa5ffc939d6289957aabee03feacbef8f3b48"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.5.2/quickrun-linux-arm64.tar.gz"
      sha256 "a0dd9bd11135847ffb1c7aa8c43da69d7bd59691d15862a891d02bafdeca3f69"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.5.2/quickrun-linux-x64.tar.gz"
      sha256 "e76048418041419493fdf52537bc3e6991dd50da119891ab703d9ca3edb23c56"
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
