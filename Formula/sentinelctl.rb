class Sentinelctl < Formula
  desc "Headless mobile app security audit CLI for iOS and Android binaries"
  homepage "https://sentinelden.com/audit"
  url "https://sentinelden.com/audit/cli/sentinelctl-1.0.1.tar.gz"
  sha256 "a54a1746b391ccaa91c10863fc9e8fb001226443e4a7b5f9a2c1175e50abf0ab"
  version "1.0.1"
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
