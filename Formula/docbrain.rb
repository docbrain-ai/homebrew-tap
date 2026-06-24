class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.5.6"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.6/docbrain-darwin-arm64"
      sha256 "8e4143801bad53e7bd821a5113cb92b405b1a1776f35369da11f75bf48f05b10"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.6/docbrain-darwin-amd64"
      sha256 "8cdcd6a7b9ca4573736288828596407d9f0e301dc0f1268b04dbd28dc49a34d2"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.6/docbrain-linux-amd64"
    sha256 "36fb49fdc102988996ba10641df5d5165652f55f3c2f755678027d006355c690"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
