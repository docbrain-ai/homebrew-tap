class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.4.12"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.12/docbrain-darwin-arm64"
      sha256 "21cf5f6181401d899f90691f6bfbb4b3bcf1ea32862ac2e412451ab1aa74bf2b"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.12/docbrain-darwin-amd64"
      sha256 "d210ca6ae7b17f71e861ed66fd38d332c3cab7601396bcdcc98a74e4688a7d15"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.12/docbrain-linux-amd64"
    sha256 "adf05bee86138e40981c38f6e4127d20200161f59efcb4b77748fe4da5edbcae"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
