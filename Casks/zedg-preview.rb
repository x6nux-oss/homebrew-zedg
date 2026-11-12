cask "zedg-preview" do
  version "1.28.1"

  on_arm do
    url "https://github.com/x6nux-oss/zed-globalization/releases/download/v1.28.1/zedg-zh-cn-macos-aarch64-v1.28.1.dmg"
    sha256 "7bd3d5b48603017578a9175b2cbb691ac865ac74160d9d76263ce347fcd47b5b"
  end
  on_intel do
    url "https://github.com/x6nux-oss/zed-globalization/releases/download/v1.28.1/zedg-zh-cn-macos-x86_64-v1.28.1.dmg"
    sha256 "eddc606160de153f88fe2fa4ea6df722e767d71c80cc06a17cf30f1f1bbc5304"
  end

  name "ZedG"
  desc "Zed Editor (Localized / 汉化版) - Preview"
  homepage "https://github.com/x6nux-oss/zed-globalization"

  depends_on macos: ">= :ventura"

  app "ZedG.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/ZedG.app"]
  end

  zap trash: [
    "~/Library/Application Support/Zed",
    "~/Library/Caches/dev.zed.ZedG",
    "~/Library/Preferences/dev.zed.ZedG.plist",
  ]
end
