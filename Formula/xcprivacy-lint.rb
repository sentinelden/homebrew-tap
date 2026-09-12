class XcprivacyLint < Formula
  desc "Validate iOS PrivacyInfo.xcprivacy against a binary's actual API surface"
  homepage "https://github.com/sentinelden/xcprivacy-lint"
  url "https://github.com/sentinelden/xcprivacy-lint/releases/download/v0.2.0/xcprivacy-lint-0.2.0-macos-universal.tar.gz"
  sha256 "f6ceeaa894dd5cf54c4168b75ba6e02bd9ba654ab8ff1ca5ff787d0abaab476a"
  version "0.2.0"
  license "MIT"

  # Prebuilt universal binary (arm64 + x86_64), ad-hoc signed.
  #
  # Shipped prebuilt rather than built from source because Homebrew's build
  # sandbox has no network access, and a SwiftPM build needs to resolve
  # package dependencies. Building from source works fine outside Homebrew --
  # see the repository README.
  depends_on :macos

  def install
    bin.install "xcprivacy-lint"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/xcprivacy-lint --version")
  end
end
