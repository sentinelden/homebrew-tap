class Sentinelctl < Formula
  desc "Headless mobile app security audit CLI for iOS and Android binaries"
  homepage "https://sentinelden.com/audit"
  url "https://sentinelden.com/audit/cli/sentinelctl-1.16.1.tar.gz"
  sha256 "778846c89000a41c2b93c58c3f63533530af7d0164ea7541c2d037cc63925e4e"
  version "1.16.1"
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
