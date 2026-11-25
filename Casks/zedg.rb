cask "zedg" do
  version "1.30.2"

  on_arm do
    url "https://github.com/x6nux-oss/zed-globalization/releases/download/v1.30.2/zedg-zh-cn-macos-aarch64-v1.30.2.dmg"
    sha256 "8981d1a578404a086590ab5a08e70d06187c8b236d839fcfbdc51173b2c246c9"
  end
  on_intel do
    url "https://github.com/x6nux-oss/zed-globalization/releases/download/v1.30.2/zedg-zh-cn-macos-x86_64-v1.30.2.dmg"
    sha256 "b5889d001783b1e7ba630140389d41a39598ead29988325df5cec2a52d112514"
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
