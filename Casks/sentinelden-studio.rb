cask "sentinelden-studio" do
  version "1.13.0"
  sha256 "0dd71b4e48cab531cfb6e06a42db4ee17e14a62685c7b126c0661887366ddb81"

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
