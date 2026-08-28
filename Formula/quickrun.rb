# Homebrew formula for QuickRun. Served from the project site, so no tap is needed:
#   brew install https://fgilde.github.io/QuickRun/quickrun.rb
#
# If a fgilde/homebrew-tap repository exists, copying this file into its Formula/
# directory also makes "brew install fgilde/tap/quickrun" work, with upgrade tracking.
class Quickrun < Formula
  desc "Run any git repository with one click"
  homepage "https://fgilde.github.io/QuickRun"
  version "0.9.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.3/quickrun-osx-arm64.tar.gz"
      sha256 "e16a8c000f46ff4691918825ff7b62af2565f2cd816f82b7eeab7971437c653f"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.3/quickrun-osx-x64.tar.gz"
      sha256 "4008c377e1e9c827908091f24e76f60a68ff18c6cdb03885e79ef68d05906590"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.3/quickrun-linux-arm64.tar.gz"
      sha256 "1c94c5ea41d91079abad6ad1bfaafe909edad57b1941015128e38749a96b9a46"
    end
    on_intel do
      url "https://github.com/fgilde/QuickRun/releases/download/v0.9.3/quickrun-linux-x64.tar.gz"
      sha256 "da0a7464c447a72aa4c2a1275da6aa9f597d171c751b8348dfec4147e25755e2"
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
