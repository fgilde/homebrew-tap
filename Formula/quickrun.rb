# Homebrew formula for QuickRun. Served from the project site, so no tap is needed:
#   brew install https://fgilde.github.io/QuickRun/quickrun.rb
#
# If a fgilde/homebrew-tap repository exists, copying this file into its Formula/
# directory also makes "brew install fgilde/tap/quickrun" work, with upgrade tracking.
class Quickrun < Formula
  desc "Run any git repository with one click"
  homepage "https://fgilde.github.io/QuickRun"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.5.0/quickrun-osx-arm64.tar.gz"
      sha256 "7bb13ed36c636a9035e159115f637dc40a48a690a8b9a616301c35d868f4435b"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.5.0/quickrun-osx-x64.tar.gz"
      sha256 "97800e8e9855de1b137b09a7b6ce01875f57adcf280f7b66a22bc13d4fa8df5e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.5.0/quickrun-linux-arm64.tar.gz"
      sha256 "09fa79bfcc01b415fa497cc2ed917e805023156ae98f9309b8c823bbd993dd5d"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.5.0/quickrun-linux-x64.tar.gz"
      sha256 "5ce09b0e99a5adf02b2759650c429d7a6432e9061b2746ca03f128470c40be9a"
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
