class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.3.16"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.16/docbrain-darwin-arm64"
      sha256 "9082491fc1b72076a7ef4ca13e344b11847e1558b1103e7453b2c23dbb3bfd28"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.16/docbrain-darwin-amd64"
      sha256 "0a142800a959047acc04af80be227deeb2ea4e72abb0ff4abc9121befb98b5d3"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.16/docbrain-linux-amd64"
    sha256 "a848bf3f06b06906f5bbe3d4fc7d9cc15ae7d6623a94430073797e1ff783d80c"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
