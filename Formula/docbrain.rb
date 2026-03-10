class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.0.8"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.0.8/docbrain-darwin-arm64"
      sha256 "b95cf1c43e834d9b9a74fa5b174f886cbd28457af18c92b350fadf6f1c9b59db"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.0.8/docbrain-darwin-amd64"
      sha256 "f2d7c6fd4c7c0f9cc91a1bdcdadc8ed232b85c5bb7cf18cefece5d70a6b3a66a"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.0.8/docbrain-linux-amd64"
    sha256 "f48207f4b12527bd9565952d34d35084250ea2d98f544ed2cc29f85749c8c06b"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
