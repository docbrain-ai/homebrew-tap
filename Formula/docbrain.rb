class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.5.28"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.28/docbrain-darwin-arm64"
      sha256 "b22bb908bea7bb4e78a9c09ddf32127ca13dde71182e916be2580f0a629da554"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.28/docbrain-darwin-amd64"
      sha256 "80a9ef901f757c46f2cf4de7de26da208f38d6ad4dd78d6ea9f8e4a468eed8b3"
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
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.28/docbrain-linux-amd64"
    sha256 "77e0dac4e49a276967a9e1af43e7f7e3a7937d63a8e19a8ba9652bc6ff8ea55f"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("\#{bin}/docbrain --help")
  end
end
