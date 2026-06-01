class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.4.23"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.23/docbrain-darwin-arm64"
      sha256 "072bc72429d17acc2b58fb3a20b68ec8c3aea5278cd2d0290633039d5e807d2a"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.23/docbrain-darwin-amd64"
      sha256 "24a42e86f6f81f89185aab56a32c931f1a42605e9ecb524d1704db55a46749a4"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.23/docbrain-linux-amd64"
    sha256 "66b83c9075ab53a92bf8fddf36bc7f8a511f12c3209e3e6ff0b54ef7c91ecfcf"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
