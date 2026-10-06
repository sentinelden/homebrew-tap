class Sentinelctl < Formula
  desc "Headless mobile app security audit CLI for iOS and Android binaries"
  homepage "https://sentinelden.com/audit"
  url "https://sentinelden.com/audit/cli/sentinelctl-1.14.2.tar.gz"
  sha256 "bfac45106e1bfc8ff420623d867a6bc7f78de3de34524b105c629ac14e2184b0"
  version "1.14.2"
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
