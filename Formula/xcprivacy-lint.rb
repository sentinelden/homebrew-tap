class XcprivacyLint < Formula
  desc "Validate iOS PrivacyInfo.xcprivacy against a binary's actual API surface"
  homepage "https://github.com/sentinelden/xcprivacy-lint"
  url "https://github.com/sentinelden/xcprivacy-lint/releases/download/v0.3.0/xcprivacy-lint-0.3.0-macos-universal.tar.gz"
  sha256 "695c87f86342cda16e38a99cbfc31c7c7d0a3bd6cee041b5434aedf77a289e26"
  version "0.3.0"
  license "MIT"

  # Prebuilt universal binary (arm64 + x86_64), ad-hoc signed.
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
