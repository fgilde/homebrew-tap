# Homebrew formula for QuickRun. Served from the project site, so no tap is needed:
#   brew install https://fgilde.github.io/QuickRun/quickrun.rb
#
# If a fgilde/homebrew-tap repository exists, copying this file into its Formula/
# directory also makes "brew install fgilde/tap/quickrun" work, with upgrade tracking.
class Quickrun < Formula
  desc "Run any git repository with one click"
  homepage "https://fgilde.github.io/QuickRun"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.6.0/quickrun-osx-arm64.tar.gz"
      sha256 "e9a664eb54ddcc33bdd67cc19c3cc5568f265e9f40b5630ccb89f45c8e85923a"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.6.0/quickrun-osx-x64.tar.gz"
      sha256 "39b625e90357409b5e93a87ebaf5b2105d7b6ca2f2b6059876678eeb741cb8fc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.6.0/quickrun-linux-arm64.tar.gz"
      sha256 "ec2dcb1054092052582eb6e696743c20ed083bf64523cc3db20ecac26fda5260"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.6.0/quickrun-linux-x64.tar.gz"
      sha256 "fb82134fd871425b74d0e51933a9c16bd748897c15ee86c171caa35bfe7afdfb"
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
