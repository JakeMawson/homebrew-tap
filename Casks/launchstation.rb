cask "launchstation" do
  version "1.3.13"
  sha256 "8e1834e2fc366c7473df6b597dd4cd166e2482b44491aa7f3e00b01b579bc34b"

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

  postflight_steps do
    run "/bin/zsh",
        args:           ["{{appdir}}/Launch Station.app/Contents/Resources/bin/configure-launch-station", "--install",
                         "{{appdir}}/Launch Station.app"],
        env:            { "LAUNCH_STATION_SETUP_MODE" => "stage-only" },
        writable_paths: ["Library/Application Support/Launch Station",
                         "Library/LaunchAgents", "Library/Logs/Launch Station"],
        writable_base:  :home
  end

  uninstall launchctl: "com.jakemawson.launchstation.service"

  caveats <<~EOS
    Launch Station keeps your launcher catalog and session history in:
      ~/Library/Application Support/Launch Station

    Homebrew upgrades and uninstall preserve that data.
  EOS
end
