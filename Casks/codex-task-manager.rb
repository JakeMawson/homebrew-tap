cask "codex-task-manager" do
  version "0.1.1"
  sha256 "82d14e1ecda80a979bb1255d4ad203ee1f131f667c6aeba4396d27fc410c3c94"

  url "https://github.com/JakeMawson/codex-task-manager/releases/download/v#{version}/Codex-Task-Manager-#{version}.zip"
  name "Codex Task Manager"
  desc "Local Codex task status in your menu bar"
  homepage "https://stacksimpl.web.app/codex-task-manager/"

  depends_on macos: :sequoia

  app "Codex Task Manager.app"

  caveats <<~EOS
    Early beta: task-status behavior is still being refined.
    Keep Codex as the source of truth for your tasks.
  EOS
end
