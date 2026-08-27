# Homebrew formula for QuickRun. Served from the project site, so no tap is needed:
#   brew install https://fgilde.github.io/QuickRun/quickrun.rb
#
# If a fgilde/homebrew-tap repository exists, copying this file into its Formula/
# directory also makes "brew install fgilde/tap/quickrun" work, with upgrade tracking.
class Quickrun < Formula
  desc "Run any git repository with one click"
  homepage "https://fgilde.github.io/QuickRun"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.8.1/quickrun-osx-arm64.tar.gz"
      sha256 "ad0b8e45c4c265b9a9ff0766f41f5cec3d20cbdeb7c60bfe88b6f10877cc25d3"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.8.1/quickrun-osx-x64.tar.gz"
      sha256 "c57fcc8c2c637183480d9e704dc58f058c7154dc3fc116bcf3fb682e5786245c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.8.1/quickrun-linux-arm64.tar.gz"
      sha256 "b62c59e50a368c412ed4de1ac6eca645cc5cdca633b335fbf57a8c9ec862f25a"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.8.1/quickrun-linux-x64.tar.gz"
      sha256 "386a2ef4a2ec9df915551853b10e7d35ba900b673eec9829f9f8aa898972986a"
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
