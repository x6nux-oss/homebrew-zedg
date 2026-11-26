cask "zedg-preview" do
  version "1.31.0-pre"

  on_arm do
    url "https://github.com/x6nux-oss/zed-globalization/releases/download/v1.31.0-pre/zedg-zh-cn-macos-aarch64-v1.31.0-pre.dmg"
    sha256 "18fb3827f7637c8b7bb858f57f6b8cf1b2479151d30c7c66ef845773159ec490"
  end
  on_intel do
    url "https://github.com/x6nux-oss/zed-globalization/releases/download/v1.31.0-pre/zedg-zh-cn-macos-x86_64-v1.31.0-pre.dmg"
    sha256 "05e9b1156431714a8837e97200ec17249c9253461270c006da013e97edd3e008"
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
