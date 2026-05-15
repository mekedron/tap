cask "clipslop" do
  version "1.2.6"
  sha256 "2e4d46d7b9a70c72c2cfc7478dcf3c4d685e59cbecdc466d34d283fda2fe112f"

  url "https://github.com/mekedron/clipslop/releases/download/v#{version}/ClipSlop-#{version}-macOS.dmg"
  name "ClipSlop"
  desc "Keyboard-first AI text pipeline for macOS"
  homepage "https://github.com/mekedron/ClipSlop"

  depends_on macos: ">= :sonoma"

  app "ClipSlop.app"

  zap trash: [
    "~/Library/Application Support/ClipSlop",
    "~/Library/Preferences/com.clipslop.app.plist",
  ]
end
