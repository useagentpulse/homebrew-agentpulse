cask "agentpulse" do
  version "1.0.0"
  sha256 "92f4a1466a9f16715cce8a7214a9ebe21affb464df8a0ae02212a3e54d5ebda7"

  url "https://github.com/useagentpulse/agentpulse-app/releases/download/v#{version}/AgentPulse-#{version}.dmg"
  name "Agent Pulse"
  desc "macOS menu bar app that monitors AI coding agent sessions"
  homepage "https://github.com/useagentpulse/agentpulse-app"

  depends_on macos: ">= :sonoma"

  app "AgentPulse.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/AgentPulse.app"]
  end

  zap trash: [
    "~/Library/Application Support/AgentPulse",
    "~/Library/Preferences/com.agentpulse.AgentPulse.plist",
    "~/Library/LaunchAgents/com.agentpulse.AgentPulse.plist",
  ]
end
