class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.4.7"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.7/docbrain-darwin-arm64"
      sha256 "5621db608e1f23c65354cce25578d41848156ceb787f6a15c82bf0e16952148c"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.7/docbrain-darwin-amd64"
      sha256 "a4b007136a60cfe8862ad55b07817156ce2c15fddac7d819c61289b01929ba87"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.7/docbrain-linux-amd64"
    sha256 "ca210b70f2e20e8461bf39da1b6e5c60a13ffcfbcea1dc24d54953be61d06d3d"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
