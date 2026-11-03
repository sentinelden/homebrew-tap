cask "sentinelden-studio" do
  version "1.20.0"
  sha256 "0bad3c212fe2fd8ffc5b16506385c80146f60d90c5e398d4e5cee99a19d487d9"

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
