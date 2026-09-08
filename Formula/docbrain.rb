class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.5.25"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.25/docbrain-darwin-arm64"
      sha256 "a484c7e1107e54cf4ddab3fa798fdf41305beccb1170f7ea5ffa141624e89ee1"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.25/docbrain-darwin-amd64"
      sha256 "cf9af25292d4b7ba9e5bb2f2338777bd6341d8570c438995e0e81de7e9c61c07"
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
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.25/docbrain-linux-amd64"
    sha256 "dd99bac02b8320602d2bea316c0bac7358e6cc04a263149eb484998a91ada8be"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("\#{bin}/docbrain --help")
  end
end
