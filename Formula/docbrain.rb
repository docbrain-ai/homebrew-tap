class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.1.10"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.10/docbrain-darwin-arm64"
      sha256 "79ac526eaf19b4d4b77feb30af201f6f19a47945568ed6022f24138d539820ba"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.10/docbrain-darwin-amd64"
      sha256 "680b37d927c43339ec6c4c64a29de397c5b8ab605cddeb0ade3715268ecd0500"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.10/docbrain-linux-amd64"
    sha256 "c5187896d061df0a656a821890d5878d1ac7148e89aa13907cf9ec82f778b308"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
