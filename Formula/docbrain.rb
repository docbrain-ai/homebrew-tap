class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.4.4"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.4/docbrain-darwin-arm64"
      sha256 "b701823fd2ffa6b5b8399da161ad48c1cedb984e2365e9ee173d1ca0e94c8714"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.4/docbrain-darwin-amd64"
      sha256 "5da03b254e3523ea71267d1058582f34b388d72b9d8b141d79f3d8a2edf7d9e2"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.4/docbrain-linux-amd64"
    sha256 "4d393e5affe7f60ae5054ecf380dc76c350a386298b0a14fe0b354ce1d786a1e"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
