class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.5.20"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.20/docbrain-darwin-arm64"
      sha256 "a3acdeced2fcb32eca712b8fb9c8dca2f116728566e8f0475c875900e9da030b"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.20/docbrain-darwin-amd64"
      sha256 "ff42d695b360ea922e480bff385aeb02d2f900f62002ebdf37b09a941fcbc4a8"
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
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.20/docbrain-linux-amd64"
    sha256 "efd50793832fb0be0d60b7b0afd1722171e5514e44bed258b8dac5ec86c9ee8c"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("\#{bin}/docbrain --help")
  end
end
