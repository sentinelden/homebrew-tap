cask "sentinelden-studio" do
  version "1.20.1"
  sha256 "8eac23de250b12e9715255b9d35dd80949d2913680c0b5398da256837ac84701"

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
