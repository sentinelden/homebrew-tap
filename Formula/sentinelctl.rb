class Sentinelctl < Formula
  desc "Headless mobile app security audit CLI for iOS and Android binaries"
  homepage "https://sentinelden.com/audit"
  url "https://sentinelden.com/audit/cli/sentinelctl-1.18.0.tar.gz"
  sha256 "010af07ef2700b031a0ce18a3c5e0ca064153b47097691bff4c59b8fd80dfde3"
  license :cannot_represent

  # Universal (arm64 + x86_64), Developer ID signed and notarized.
  # Built with a macOS 14 deployment target; release-cli.sh refuses any other.
  depends_on macos: :sonoma

  def install
    bin.install "sentinelctl"
    pkgshare.install "THIRD-PARTY-NOTICES.txt"
  end

  test do
    assert_match "sentinelctl #{version}", shell_output("#{bin}/sentinelctl --version")
  end
end
