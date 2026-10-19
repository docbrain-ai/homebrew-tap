class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.6.0"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.6.0/docbrain-darwin-arm64"
      sha256 "c80e517b7d5a7087461cc0ddf907bc23d93f8081454e6eb5d1e283c03a5b5fa0"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.6.0/docbrain-darwin-amd64"
      sha256 "4c9792eca0b66b1801b805e5be1b9aecef77cf55feb183fc96eb46a372a541a6"
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
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.6.0/docbrain-linux-amd64"
    sha256 "5f78b3d55a7f578f7824af9d1bd850c2aa6d471c488db2ad80b202fdb1151452"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("\#{bin}/docbrain --help")
  end
end
