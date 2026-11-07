cask "zedg-preview" do
  version "1.28.0-pre.1"

  on_arm do
    url "https://github.com/x6nux-oss/zed-globalization/releases/download/v1.28.0-pre.1/zedg-zh-cn-macos-aarch64-v1.28.0-pre.dmg"
    sha256 "c7ac3b0445dfbe7b0f993bedb2f4aff455b9437954ce5701c727badeb7ad5768"
  end
  on_intel do
    url "https://github.com/x6nux-oss/zed-globalization/releases/download/v1.28.0-pre.1/zedg-zh-cn-macos-x86_64-v1.28.0-pre.dmg"
    sha256 "7a6917e45894e1962dea6960d4c4ee230e98ab8eca7ec9846e470cf0781a6fcf"
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
