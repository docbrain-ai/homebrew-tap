class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.3.4"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.4/docbrain-darwin-arm64"
      sha256 "33dd9775dd1fbaad43b2137bf79d44ae67a9bc02e6e87ce1f6426447ae4859a3"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.4/docbrain-darwin-amd64"
      sha256 "bdd00fff16895c34cb6b7750ee82375ae609fa74c856e2806b1ba7e10041d8b1"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.4/docbrain-linux-amd64"
    sha256 "88ce109e8a0653f030175d42efb1fc33f4e7cb6dbfb42b79a131c7eb9bab8594"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
