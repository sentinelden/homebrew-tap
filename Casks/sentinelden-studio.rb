cask "sentinelden-studio" do
  version "1.10.0"
  sha256 "1b1e2d4c0b71e1bf207cbd38724463a27e85c0f1d41c1885a15c9f68411d376d"

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
