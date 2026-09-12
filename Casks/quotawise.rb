cask "quotawise" do
  version "1.1.4"
  sha256 "08e8be29d50200c9b5c785838f33a94ad04e984f9dc18de94caef39e74ad60e0"

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
