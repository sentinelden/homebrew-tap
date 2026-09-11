class Sentinelctl < Formula
  desc "Headless mobile app security audit CLI for iOS and Android binaries"
  homepage "https://sentinelden.com/audit"
  url "https://sentinelden.com/audit/cli/sentinelctl-1.6.0.tar.gz"
  sha256 "7dca8f9f3f213d4d5d2f2df6db726122658aa3f85bf42a33a33f52b03f156047"
  version "1.6.0"
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
