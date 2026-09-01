class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.5.16"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.16/docbrain-darwin-arm64"
      sha256 "0933d7f63a7c2a750c417b61a1ad70ab4a8461094ceaf6b9f8c73898785a4b95"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.16/docbrain-darwin-amd64"
      sha256 "122eaeb3fe34d4a06a6bc2fb5e23ca7b9a965bb68fe890af49862684642169f3"
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
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.16/docbrain-linux-amd64"
    sha256 "40f1a1327c373c51626fd8ddac883e3aa71476fed49d8ee49cf87e579b5cb3ad"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("\#{bin}/docbrain --help")
  end
end
