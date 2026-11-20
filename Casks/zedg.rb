cask "zedg" do
  version "1.29.3"

  on_arm do
    url "https://github.com/x6nux-oss/zed-globalization/releases/download/v1.29.3/zedg-zh-cn-macos-aarch64-v1.29.3.dmg"
    sha256 "8d4c6dbd7d8fa1e59c45cb590f92756980bc155ab266662fecb7c8f9136bdb63"
  end
  on_intel do
    url "https://github.com/x6nux-oss/zed-globalization/releases/download/v1.29.3/zedg-zh-cn-macos-x86_64-v1.29.3.dmg"
    sha256 "14a5927c6bb670c81f4e4d18b2f95d220fbb45252718e13f90ee53d4cbd4573e"
  end

  name "ZedG"
  desc "Zed Editor (Localized / 汉化版)"
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
