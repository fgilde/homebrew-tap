# Homebrew formula for QuickRun. Served from the project site, so no tap is needed:
#   brew install https://fgilde.github.io/QuickRun/quickrun.rb
#
# If a fgilde/homebrew-tap repository exists, copying this file into its Formula/
# directory also makes "brew install fgilde/tap/quickrun" work, with upgrade tracking.
class Quickrun < Formula
  desc "Run any git repository with one click"
  homepage "https://fgilde.github.io/QuickRun"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.3.0/quickrun-osx-arm64.tar.gz"
      sha256 "0ef718673dffbde6cd773985860c8768b56ef4226d8dca624504e5e1a8848312"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.3.0/quickrun-osx-x64.tar.gz"
      sha256 "f8f34d2b46e4796364c1a9db6e1e0660f983a98fba756a8ae1f640a218e5e9a3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.3.0/quickrun-linux-arm64.tar.gz"
      sha256 "1517b61170dd6ecf43146a7c64c697c79766df019ad16cb166735c2101a0d0f0"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.3.0/quickrun-linux-x64.tar.gz"
      sha256 "edc60312b0c0eb2337f52d0bcbb4e7d293efb6f1c70189de6f0d1149672c42ff"
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
