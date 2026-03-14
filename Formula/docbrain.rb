class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.1.5"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.5/docbrain-darwin-arm64"
      sha256 "dcb4421fae2698f2770e1f16de1eb7c65a044255394ee36c418096f645a4efd0"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.5/docbrain-darwin-amd64"
      sha256 "39f194a5f126838cb195350c6d53c09f88e834830ca2fbca83d96a81ce4696e1"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.5/docbrain-linux-amd64"
    sha256 "e24344fd3ae98584230cca815ecdc9273bce979b858d389fcaf3a97f25ee655a"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
