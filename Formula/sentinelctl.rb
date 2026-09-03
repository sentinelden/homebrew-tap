class Sentinelctl < Formula
  desc "Headless mobile app security audit CLI for iOS and Android binaries"
  homepage "https://sentinelden.com/audit"
  url "https://sentinelden.com/audit/cli/sentinelctl-1.5.0.tar.gz"
  sha256 "ae28bbafbba9378cbc7f01004e7c8cfaba9cc5dc01618954396a825faf780fe9"
  version "1.5.0"
  license :cannot_represent

  # Universal (arm64 + x86_64), Developer ID signed and notarized.
  depends_on :macos

  def install
    bin.install "sentinelctl"
  end

  test do
    assert_match "sentinelctl #{version}", shell_output("#{bin}/sentinelctl --version")
  end
end
