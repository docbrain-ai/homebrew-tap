class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.3.18"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.18/docbrain-darwin-arm64"
      sha256 "7611ea9d97d8a5475d98acd68654150252f409bbad20a3d87de7ffbbc74e52a8"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.18/docbrain-darwin-amd64"
      sha256 "4262b994dc3b706eb9a5bb86a3560624222534ef3cd401475da0e3471cf6172c"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.18/docbrain-linux-amd64"
    sha256 "c4152ff87cd1c1d23c1b2065aab8c051ba3de6ba8e0eb4c1cfbbb80e80e63fd1"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
