class Machoscope < Formula
  desc "Inspect a Mach-O binary's hardening posture"
  homepage "https://github.com/sentinelden/machoscope"
  url "https://github.com/sentinelden/machoscope/releases/download/v0.1.1/machoscope-0.1.1-macos-universal.tar.gz"
  sha256 "25699fa921910f35ecaef23284e10e053c9a8ff7716dfac312d430b96a9ae798"
  version "0.1.1"
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

    # Exercise a real scan, not just --version. Exit status is 1 when a binary
    # has warnings, which /bin/ls does, so allow it rather than asserting 0.
    output = shell_output("#{bin}/machoscope /bin/ls", 1)
    assert_match "machoscope", output
  end
end
