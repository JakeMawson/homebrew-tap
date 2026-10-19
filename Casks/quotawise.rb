cask "quotawise" do
  version "1.1.6"
  sha256 "261a5f3ff2e71b47b6e22e037a477fee8e6f51c532b6360f1ee8816be1e6583e"

  url "https://github.com/JakeMawson/quotawise/releases/download/v#{version}/QuotaWise-#{version}.zip"
  name "QuotaWise"
  desc "Local AI usage intelligence"
  homepage "https://github.com/JakeMawson/quotawise"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "QuotaWise.app"
end
