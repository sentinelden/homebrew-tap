cask "sentinelden-studio" do
  version "1.9.1"
  sha256 "8d7793d3f16c633aea02b5fd5bceb009f2663feaa625b73061d1ed91557ebc2d"

  url "https://sentinelden.com/audit/download/SentinelDenStudio-#{version}.dmg"
  name "SentinelDen Studio"
  desc "Offline security audit for iOS and Android app builds"
  homepage "https://sentinelden.com/audit"

  auto_updates true
  depends_on macos: :tahoe

  app "SentinelDenStudio.app"
end
