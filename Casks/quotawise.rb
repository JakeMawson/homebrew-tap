cask "quotawise" do
  version "1.1.2"
  sha256 "2224a1166687263ce73d23c17234c8d56320effd8fb68f05b28b9a0280a06a80"

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
