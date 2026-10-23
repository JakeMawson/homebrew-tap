cask "quotawise" do
  version "1.1.7"
  sha256 "bbc5d25f4de807942b93258f3ed2a9bde3a424e29234631a4fc306293c409e8c"

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
