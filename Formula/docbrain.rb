class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.5.18"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.18/docbrain-darwin-arm64"
      sha256 "8df5ddf8e225ba3d07b2dc6b5954a7a5f4e59713b0dd86968a23a1e00c48afa6"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.18/docbrain-darwin-amd64"
      sha256 "dc2ce2a173a2e0e7a26665392ac305f2216c4d57daf75c85a29356591f24fc14"
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
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.18/docbrain-linux-amd64"
    sha256 "e0a11e629853087f054ede6e2f97fefafd109931df1f721f63db1dc965766a09"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("\#{bin}/docbrain --help")
  end
end
