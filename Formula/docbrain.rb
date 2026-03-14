class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.1.2"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.2/docbrain-darwin-arm64"
      sha256 "cfca3ef195c776ce8a6eb6e072c679f3e9719159302bb8473b97460c898c3b6d"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.2/docbrain-darwin-amd64"
      sha256 "0495e6989e3a0a893bea611f865d029fc83a8a45a1305c10d27cd2a4a9febb2d"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.2/docbrain-linux-amd64"
    sha256 "d784d2dce3eee542aa43d479190d4f6472d150d3b0eb797cc624b0ccdcb3b3f4"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
