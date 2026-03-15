class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.1.9"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.9/docbrain-darwin-arm64"
      sha256 "936320738a911623bbe045f96ae208f8ba5a6000e08f08c28d532a6e0040c7c6"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.9/docbrain-darwin-amd64"
      sha256 "55aa2caeaa8bb870751e55f8521c932d1cb5b8570154110b8e36f642c9218e12"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.9/docbrain-linux-amd64"
    sha256 "d9679fb62ebb2698d396ad6198330e4a193425110da651adf07a4bffa23be64c"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
