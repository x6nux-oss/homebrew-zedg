cask "zedg-preview" do
  version "1.28.0-pre"

  on_arm do
    url "https://github.com/x6nux-oss/zed-globalization/releases/download/v1.28.0-pre/zedg-zh-cn-macos-aarch64-v1.28.0-pre.dmg"
    sha256 "6bd9b4eb9d57e1686e224e4f97790d490c74ea27c8efc9bedf73f4ea4bc9ff64"
  end
  on_intel do
    url "https://github.com/x6nux-oss/zed-globalization/releases/download/v1.28.0-pre/zedg-zh-cn-macos-x86_64-v1.28.0-pre.dmg"
    sha256 "997530d0ea3f7114576297ca69a1be76a65cf4981b445396bb73bb6a6e2ef13a"
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
