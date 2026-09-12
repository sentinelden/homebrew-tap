class Machoscope < Formula
  desc "Inspect a Mach-O binary's hardening posture"
  homepage "https://github.com/sentinelden/machoscope"
  url "https://github.com/sentinelden/machoscope/releases/download/v0.1.0/machoscope-0.1.0-macos-universal.tar.gz"
  sha256 "e61f1941ea43cc0cfd2a65f5a4f44a3641ec07385ec74ad2600199e6c73dcddd"
  version "0.1.0"
  license "MIT"

  # Prebuilt universal binary (arm64 + x86_64), ad-hoc signed.
  #
  # Shipped prebuilt rather than built from source because Homebrew's build
  # sandbox has no network access, and a SwiftPM build needs to resolve
  # package dependencies. Building from source works fine outside Homebrew --
  # see the repository README.
  depends_on :macos

  def install
    bin.install "machoscope"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/machoscope --version")
  end
end
