cask "launchstation" do
  version "1.3.15"
  sha256 "df83f40e60d0936d3b83b9d7e6100922f0e5c54a512ac5940a3f53b93f9122c2"

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
