class Sentinelctl < Formula
  desc "Headless mobile app security audit CLI for iOS and Android binaries"
  homepage "https://sentinelden.com/audit"
  url "https://sentinelden.com/audit/cli/sentinelctl-1.10.0.tar.gz"
  sha256 "7635cbe497b255c23a1149ed8bc21bbc31c36fc56e1f7f21d1d0c1b8514db68b"
  version "1.10.0"
  license :cannot_represent

  # Universal (arm64 + x86_64), Developer ID signed and notarized.
  # Built with a macOS 14 deployment target; release-cli.sh refuses any other.
  depends_on macos: :sonoma

  def install
    bin.install "sentinelctl"
  end

  test do
    assert_match "sentinelctl #{version}", shell_output("#{bin}/sentinelctl --version")
  end
end
