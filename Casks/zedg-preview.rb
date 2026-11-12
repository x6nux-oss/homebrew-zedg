cask "zedg-preview" do
  version "1.29.1-pre"

  on_arm do
    url "https://github.com/x6nux-oss/zed-globalization/releases/download/v1.29.1-pre/zedg-zh-cn-macos-aarch64-v1.29.1-pre.dmg"
    sha256 "115464c20fb5d978927d01bb8a392f9cabbd537807fe49f52de9458fe869ba6c"
  end
  on_intel do
    url "https://github.com/x6nux-oss/zed-globalization/releases/download/v1.29.1-pre/zedg-zh-cn-macos-x86_64-v1.29.1-pre.dmg"
    sha256 "d50cdd1664b5d0ca4c17492de2197bb62cc33a3c7b45fbd320e680e8c6c6a591"
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
