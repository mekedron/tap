cask "clipslop" do
  version "1.2.2"
  sha256 "8bce7c2f14bfe4cf2df577459328d067251ea6d87a653d1b785523b9e224bcd7"

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
