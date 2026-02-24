class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "0.3.2"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v0.3.2/docbrain-darwin-arm64"
      sha256 "69463f0325fd87fb08def6e2071f7d463e2812a22c07065f94a10f2cdeaf6bf5"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v0.3.2/docbrain-darwin-amd64"
      sha256 "b2ff5bee6465ebc10d33a75e597bb5cdf4783a135da062cdb6d5ba473559987e"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v0.3.2/docbrain-linux-amd64"
    sha256 "19de87036ed34904cb2fad6f4e0aa8d5641fc44ae39b466bb945272736e6824d"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("\#{bin}/docbrain --help")
  end
end
