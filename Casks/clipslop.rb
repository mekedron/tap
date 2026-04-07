cask "clipslop" do
  version "1.1.9"
  sha256 "4d7224548f31b504ac7a54958bc5cc2550c40cae242865179f00af5c17200a0f"

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
