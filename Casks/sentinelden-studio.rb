cask "sentinelden-studio" do
  version "1.14.1"
  sha256 "25d42324a134f6016efe57509982331259908a607e6c34d88ef753e7adf75c42"

  url "https://sentinelden.com/audit/download/SentinelDenStudio-#{version}.dmg"
  name "SentinelDen Studio"
  desc "Offline security audit for iOS and Android app builds"
  homepage "https://sentinelden.com/audit"

  livecheck do
    url "https://api.sentinelden.com/audit/version"
    strategy :json do |json|
      json.dig("payload", "latest_version")
    end
  end

  auto_updates true
  depends_on macos: :tahoe

  app "SentinelDenStudio.app"
end
