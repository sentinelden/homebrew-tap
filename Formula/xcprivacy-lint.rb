class XcprivacyLint < Formula
  desc "Validate iOS PrivacyInfo.xcprivacy against a binary's actual API surface"
  homepage "https://github.com/sentinelden/xcprivacy-lint"
  url "https://github.com/sentinelden/xcprivacy-lint/releases/download/v0.3.1/xcprivacy-lint-0.3.1-macos-universal.tar.gz"
  version "0.3.1"
  sha256 "3048e073934e740c79799285a593e0ebf1a276fd5eac340aef70cc0b49b1035c"
  license "MIT"

  # Prebuilt universal binary (arm64 + x86_64), signed with Developer ID
  # Application: Junaid Khan (647SZ7Q47T) and notarized.
  #
  # Shipped prebuilt rather than built from source because Homebrew's build
  # sandbox has no network access, and a SwiftPM build has to resolve package
  # dependencies. Building from source works fine outside Homebrew; see the
  # repository README.
  depends_on :macos

  def install
    # The binary and its SwiftPM resource bundle must sit in the same
    # directory: Bundle.module locates symbols.yaml relative to the
    # executable. Installing the binary alone produces a tool that answers
    # --version happily and then traps on the first real run.
    libexec.install "xcprivacy-lint", "xcprivacy-lint_XCPrivacyLintCore.bundle"
    bin.install_symlink libexec/"xcprivacy-lint"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/xcprivacy-lint --version")

    # Exercise a real lint, not just --version. Loading the symbol map is what
    # catches a missing resource bundle, and --version never touches it.
    output = shell_output("#{bin}/xcprivacy-lint --binary /bin/ls 2>&1")
    assert_match "xcprivacy-lint", output
    refute_match "unable to find bundle", output
  end
end
