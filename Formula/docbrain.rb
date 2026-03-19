class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.2.3"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.2.3/docbrain-darwin-arm64"
      sha256 "8bee3681ffc26db12ee89d7be6f5a5f8611487e26941e1722f89e845e176044b"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.2.3/docbrain-darwin-amd64"
      sha256 "e661475d3090d70d6278b2ff82234afeed00d236173a7ceb98a239af3c9f0c42"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.2.3/docbrain-linux-amd64"
    sha256 "de9c6352bdacbade8915bf56e05e6df1e58a5d6740f7526d9a96cdd72ffade58"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
