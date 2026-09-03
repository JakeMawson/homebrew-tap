cask "launchstation" do
  version "1.3.1"
  sha256 "00a74eb484963b3a89a13407d0cfd4ffcc2d9d8094feb224fee2b18e31ad6432"

  url "https://github.com/JakeMawson/launchstation/releases/download/v#{version}/Launch-Station-#{version}.zip"
  name "Launch Station"
  desc "Start, manage, and understand every local project"
  homepage "https://launchstation.net/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Launch Station.app"
  binary "#{appdir}/Launch Station.app/Contents/Resources/bin/launch"

  postflight do
    system_command "#{appdir}/Launch Station.app/Contents/Resources/bin/configure-launch-station",
                   args: ["--install", "#{appdir}/Launch Station.app"]
  end

  uninstall_preflight do
    system_command "#{appdir}/Launch Station.app/Contents/Resources/bin/configure-launch-station",
                   args: ["--uninstall"]
  end

  caveats <<~EOS
    Launch Station keeps your launcher catalog and session history in:
      ~/Library/Application Support/Launch Station

    Homebrew upgrades and uninstall preserve that data.
  EOS
end
