class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.4.20"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.20/docbrain-darwin-arm64"
      sha256 "c93c819eacdbd9dbeb9376160e27d4028724eabc167133f3128c27cdee41da46"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.20/docbrain-darwin-amd64"
      sha256 "ef8506787cdec9f7bb5f5db721e55918a178a990a8f00ebda55979ef11b2315b"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.20/docbrain-linux-amd64"
    sha256 "1764d25ed8193e8f81f31be7907a2890bd7c0b3d26968995dcf7307b0a2b1d49"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
