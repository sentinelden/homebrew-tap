class Sentinelctl < Formula
  desc "Headless mobile app security audit CLI for iOS and Android binaries"
  homepage "https://sentinelden.com/audit"
  url "https://sentinelden.com/audit/cli/sentinelctl-1.4.0.tar.gz"
  sha256 "113d549aacdf9084f3de8169ac6085fdb6c242906b85139c3b5c9e674811a440"
  version "1.4.0"
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
