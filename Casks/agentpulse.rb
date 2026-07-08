cask "agentpulse" do
  version "1.0.1"
  sha256 "06a7f0ada95101739989923442a6f615f9801bce8a75954b62888c0382635380"

  url "https://github.com/useagentpulse/agentpulse-app/releases/download/v#{version}/AgentPulse-#{version}.dmg"
  name "Agent Pulse"
  desc "macOS menu bar app that monitors AI coding agent sessions"
  homepage "https://github.com/useagentpulse/agentpulse-app"

  depends_on macos: :sonoma

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
