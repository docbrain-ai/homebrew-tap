class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.0.5"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.0.5/docbrain-darwin-arm64"
      sha256 "98b43b586d6d2c0f8e39d4bb576918f9f29c07cb139d0e30ad38fffd3e1de0ca"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.0.5/docbrain-darwin-amd64"
      sha256 "5be8a4a1fe4ac6fac7944d1887675558d3a2165c31e681e86b17ba9edd513511"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.0.5/docbrain-linux-amd64"
    sha256 "8812faf74355fe6667f545160588712a534fa770046f51eae96c539f1d8f08da"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
