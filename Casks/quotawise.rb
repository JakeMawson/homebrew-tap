cask "quotawise" do
  version "1.1.5"
  sha256 "03c01d4179519b86e7c2a0cad440e7fe59f85ab52c4f482a3c61203e4695242c"

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
