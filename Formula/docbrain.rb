class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.6.6"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.6.6/docbrain-darwin-arm64"
      sha256 "212911991ad76ec5a0b970517dbe65df934b24e9762744c66cf00a8e6a7fae39"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.6.6/docbrain-darwin-amd64"
      sha256 "ecfa007f276926b0d670cb4c1eefc34fcee19bc8e68bdc01144122c5f260603a"
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
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.6.6/docbrain-linux-amd64"
    sha256 "69d5d70704a31587b48c4a72228702eabad02895e88eef7f8fee81cad1a2f0a5"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("\#{bin}/docbrain --help")
  end
end
