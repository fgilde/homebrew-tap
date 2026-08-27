# Homebrew formula for QuickRun. Served from the project site, so no tap is needed:
#   brew install https://fgilde.github.io/QuickRun/quickrun.rb
#
# If a fgilde/homebrew-tap repository exists, copying this file into its Formula/
# directory also makes "brew install fgilde/tap/quickrun" work, with upgrade tracking.
class Quickrun < Formula
  desc "Run any git repository with one click"
  homepage "https://fgilde.github.io/QuickRun"
  version "0.8.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.8.2/quickrun-osx-arm64.tar.gz"
      sha256 "c17adfcb4354f92b26ac6361255138a772de6db32b4894fc8dfa6eee6d13e50e"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.8.2/quickrun-osx-x64.tar.gz"
      sha256 "64406afb390be48f7290dc759883064d83d4a468a23c4f0adabd985098529261"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.8.2/quickrun-linux-arm64.tar.gz"
      sha256 "cd2e38a8f76198f174b5866aa649b311a52ff597796affb26751a6c5a9046ac1"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.8.2/quickrun-linux-x64.tar.gz"
      sha256 "2e2588223b6f57a49845f40c3a912ec4f3e36fea765c08a5a306c09af301ff65"
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
