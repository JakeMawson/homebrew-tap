cask "quotawise" do
  version "1.1.0"
  sha256 "248b016baaf4dfe7e6266a6fdeb6b396e2137f7feda1d50edf0604bf90fefd5b"

  url "https://github.com/JakeMawson/quotawise/releases/download/v#{version}/QuotaWise-#{version}.zip"
  name "QuotaWise"
  desc "Local AI usage intelligence for macOS"
  homepage "https://github.com/JakeMawson/quotawise"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sequoia"

  app "QuotaWise.app"
end
