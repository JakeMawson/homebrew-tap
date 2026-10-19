cask "codex-task-manager" do
  version "0.2.0"
  sha256 "e52d733e45b70867caae4d0666cf9aef390e99d98b9d78661d7b0dbbf2b12eb4"

  url "https://github.com/JakeMawson/codex-task-manager/releases/download/v#{version}/Codex-Task-Manager-#{version}.zip"
  name "Codex Task Manager"
  desc "Local Codex task status in your menu bar"
  homepage "https://github.com/JakeMawson/codex-task-manager"

  depends_on macos: :sequoia

  preflight_steps do
    run "/usr/bin/codesign", args: ["--verify", "--deep", "--strict", "-R", '=anchor apple generic and identifier "com.jakemawson.codex-task-manager.launcher" and certificate leaf[subject.OU] = "6RWK4446NQ"', "{{staged_path}}/Codex Task Manager.app"]
    run "/usr/bin/codesign", args: ["--verify", "--strict", "-R", '=anchor apple generic and identifier "com.jakemawson.codex-task-manager.menuagent" and certificate leaf[subject.OU] = "6RWK4446NQ"', "{{staged_path}}/Codex Task Manager.app/Contents/Library/LoginItems/CodexTaskManagerMenuAgent.app"]
    run "/usr/bin/xcrun", args: ["stapler", "validate", "{{staged_path}}/Codex Task Manager.app"], network_access: true
  end

  app "Codex Task Manager.app"

  caveats <<~EOS
    Open Settings in the app for version information and automatic update preparation.
    Codex Desktop local IPC is an internal compatibility surface.
  EOS
end
