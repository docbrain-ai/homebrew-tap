class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.5.27"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.27/docbrain-darwin-arm64"
      sha256 "daafed575992e3e8f7107cb835cd31996368a6b97d5696d3cbf8c0bbd73c57e6"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.27/docbrain-darwin-amd64"
      sha256 "cbafe6928ad418ff94d55f4686b2ecb3533d4fad81ee4d48e7861ee52378329f"
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
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.27/docbrain-linux-amd64"
    sha256 "5abbe63a6545fbb6372d892a1c5668fdd132df3b100ce973b0585a9cc459b7d7"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("\#{bin}/docbrain --help")
  end
end
