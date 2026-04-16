cask "clipslop" do
  version "1.2.1"
  sha256 "8b1d00e37c02c72cb21f3646bea782aed6ec19eec3dd00d726a533c04293aa6a"

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
