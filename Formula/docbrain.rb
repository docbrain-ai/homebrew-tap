class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.1.0"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.0/docbrain-darwin-arm64"
      sha256 "a3443daba751a9bd40eb9bad0d36369e226b198db554d64c7ff4405a460b5925"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.0/docbrain-darwin-amd64"
      sha256 "c073969c67b392e5794b7a07c85b43c4cdfde8eeb63cc736a967485713116283"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.0/docbrain-linux-amd64"
    sha256 "bbbcc57078d6b623f596d8a407596f6491cf95c95bb71300f8c3c460a0d665fb"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
