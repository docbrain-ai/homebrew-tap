class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.5.17"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.17/docbrain-darwin-arm64"
      sha256 "11fb17505fd88e69cd35892f443d29286f57ccf142f5ec1814d48728543d6b88"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.17/docbrain-darwin-amd64"
      sha256 "fee9206824806614b5639626515f6c06fefd7d12d53f841e78b71265936f0171"
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
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.17/docbrain-linux-amd64"
    sha256 "6d4faab104a0eb5d74e0ac30108e5495b7ac265bdae136ce7f002ffe275854c5"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("\#{bin}/docbrain --help")
  end
end
