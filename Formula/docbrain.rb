class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.1.3"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.3/docbrain-darwin-arm64"
      sha256 "e0a4dc040ae2aa15d516482054eec800c76a8f3e5b82d122f0a381ae1900fca4"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.3/docbrain-darwin-amd64"
      sha256 "479e2269f15aceb1d5ce53556a05b020e07f903d9baf21ce7c314da45a19de5e"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.3/docbrain-linux-amd64"
    sha256 "f30b9239b88e4a27d21e95af7a7465a3e1018ffe42eef01d9d5c042b42b958b1"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
