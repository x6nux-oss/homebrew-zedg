cask "zedg-preview" do
  version "1.30.2-pre"

  on_arm do
    url "https://github.com/x6nux-oss/zed-globalization/releases/download/v1.30.2-pre/zedg-zh-cn-macos-aarch64-v1.30.2-pre.dmg"
    sha256 "a64913ba6f6f409f446c454f661f76848c835e071f7ab82670776165739bbb09"
  end
  on_intel do
    url "https://github.com/x6nux-oss/zed-globalization/releases/download/v1.30.2-pre/zedg-zh-cn-macos-x86_64-v1.30.2-pre.dmg"
    sha256 "21359bf4598ed7aea0cac4d3306b26976647591d377ca481fd7e392270c886b0"
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
