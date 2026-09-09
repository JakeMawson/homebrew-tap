cask "quotawise" do
  version "1.1.3"
  sha256 "d94b1a40b19aaaec59c762279263563a81f317dade4fbdcad011a7c463e33f98"

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
