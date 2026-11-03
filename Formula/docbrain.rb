class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.6.5"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.6.5/docbrain-darwin-arm64"
      sha256 "b54871e9a8643ae276b2a77ece285b8ec8270726bdc709c1b1480e6c543a52bd"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.6.5/docbrain-darwin-amd64"
      sha256 "ed07e2dee049030ca8741a48eb1d4353bc6619844ef695386e14782fe6a608b1"
    end
  end

  on_linux do
    # This job publishes no linux-arm64 binary. docbrain-cli reaches TLS
    # through reqwest's default native-tls, which is OpenSSL on Linux, and
    # cross-compiling that to aarch64 needs an arm64 sysroot the hosted
    # runners do not have.
    #
    # Stating that as depends_on rather than leaving on_linux
    # unconditional: previously an arm64 Linux host was handed the x86_64
    # binary, installed it happily, and then failed at exec with a message
    # that says nothing about architecture. brew's own unsupported-arch
    # error is the honest answer until the binary exists.
    depends_on arch: :x86_64
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.6.5/docbrain-linux-amd64"
    sha256 "1708c009aa717d740f923f18cd4a5fcf4fee72e35207c9a52268e1ce6174b030"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("\#{bin}/docbrain --help")
  end
end
