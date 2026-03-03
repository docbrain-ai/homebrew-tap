class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "0.9.3"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v0.9.3/docbrain-darwin-arm64"
      sha256 "131bab0f63c6b3816807270baa9929b5118b3df60d3cee29c8a86304aef41f48"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v0.9.3/docbrain-darwin-amd64"
      sha256 "c2ad3e42cbf7babeaa338c2ec832b3802ee89900e717ac8cd8db8044bef77694"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v0.9.3/docbrain-linux-amd64"
    sha256 "00399245129a5075e44cc292b4eed2e1107d55c06df9e8ea737dbeee88b5515a"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("\#{bin}/docbrain --help")
  end
end
