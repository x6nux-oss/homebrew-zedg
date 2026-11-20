cask "zedg-preview" do
  version "1.30.1-pre"

  on_arm do
    url "https://github.com/x6nux-oss/zed-globalization/releases/download/v1.30.1-pre/zedg-zh-cn-macos-aarch64-v1.30.1-pre.dmg"
    sha256 "8d33573ac4e4fa6f2ddb602d4d86216fb3d022fde0174c9448269d0bdd50352a"
  end
  on_intel do
    url "https://github.com/x6nux-oss/zed-globalization/releases/download/v1.30.1-pre/zedg-zh-cn-macos-x86_64-v1.30.1-pre.dmg"
    sha256 "ef049f6d390eda8cd56d2dc30e9e4a83aafb1c2a1df4bb2023207dd0afb2ee2f"
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
