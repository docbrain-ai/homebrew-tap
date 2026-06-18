class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.5.2"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.2/docbrain-darwin-arm64"
      sha256 "241dd07128bcd3c128698c6a4d22438d41185728f9d6ee8a510d58eb9360823d"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.2/docbrain-darwin-amd64"
      sha256 "cbb30371d588a2d7c3d3a504854338b44f5c8b7092da13ccfd3a7bf606ede5a1"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.2/docbrain-linux-amd64"
    sha256 "2e34fb8a427db756ba9d1c65164398e809e0943c3d3eb6c46853d20ad9d04025"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
