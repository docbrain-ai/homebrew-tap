class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.5.3"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.3/docbrain-darwin-arm64"
      sha256 "5bea42e13eff608a615406444b99d50a6f0c9f279f85cd29a5881c3986baa88c"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.3/docbrain-darwin-amd64"
      sha256 "46f49f8f3fb2d6a898eb510d0f60d253341981f2632f2235ef2ccd3bd0e04c39"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.3/docbrain-linux-amd64"
    sha256 "2367f073eb86b8b90dacc87689507e5e8e2c0a9d4adec39d76683ba179dfff32"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
