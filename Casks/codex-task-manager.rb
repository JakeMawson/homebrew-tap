cask "codex-task-manager" do
  version "0.1.0"
  sha256 "97f5694f03277c6663b67c0f9fedd3d9397ca368e40588570b45e76f9b10ece1"

  url "https://github.com/JakeMawson/codex-task-manager/releases/download/v#{version}/Codex-Task-Manager-#{version}.zip"
  name "Codex Task Manager"
  desc "Local Codex task status in your menu bar"
  homepage "https://stacksimpl.web.app/codex-task-manager/"

  depends_on macos: :sequoia

  app "Codex Task Manager.app"

  caveats <<~EOS
    Early beta: startup and task-status behavior are still being refined.
    Keep Codex as the source of truth for your tasks.
  EOS
end
