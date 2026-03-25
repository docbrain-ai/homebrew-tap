class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.3.2"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.2/docbrain-darwin-arm64"
      sha256 "b6d7b64ff9845aace1def32050d6e7e921587ba27e8c2a0d53319de06e257fcd"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.2/docbrain-darwin-amd64"
      sha256 "38e6c0346e1c8c38ec96e1443e58901b1680496bc20be510c21adae4f0a00fb6"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.2/docbrain-linux-amd64"
    sha256 "d8ec5013e3f4a3d40e23a72ca28b0af3ec58e70de25b888063ad4c8f85a09ef6"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
