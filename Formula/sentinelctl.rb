class Sentinelctl < Formula
  desc "Headless mobile app security audit CLI for iOS and Android binaries"
  homepage "https://sentinelden.com/audit"
  url "https://sentinelden.com/audit/cli/sentinelctl-1.0.0.tar.gz"
  sha256 "af343489e6426fde2af751c186288f60248867e24938e8f4be3a8f66c8b91af1"
  version "1.0.0"
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
