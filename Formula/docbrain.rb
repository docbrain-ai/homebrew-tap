class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.4.26"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.26/docbrain-darwin-arm64"
      sha256 "c0d92efcb0b037e929db282fc3244b86f56eb2aba22f2a452d762e2cb8641237"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.26/docbrain-darwin-amd64"
      sha256 "b673d79e465e4ded686f0cbaff8dc8d2f57de60351d694fbee9a02cb99961216"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.26/docbrain-linux-amd64"
    sha256 "da09c5842249e43324945a10854b74b25d8ee9e7e063bbb4a669e27f94340076"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
