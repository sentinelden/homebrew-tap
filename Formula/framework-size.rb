class FrameworkSize < Formula
  desc "Measure what a framework costs an app and hold it to a budget"
  homepage "https://github.com/sentinelden/framework-size-report"
  url "https://github.com/sentinelden/framework-size-report/releases/download/v0.1.0/framework-size-0.1.0-macos-universal.tar.gz"
  sha256 "d906a9ab6dd2c996645eebdf1c95db63ad05765f9e6890fd0e2c32eed6ffd9e0"
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
    bin.install "framework-size"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/framework-size --version")
  end
end
