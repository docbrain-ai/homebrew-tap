class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.6.7"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.6.7/docbrain-darwin-arm64"
      sha256 "c4887362f615789baaf3256d0f65edd844bf4b66bcba13de98612ade994d03fc"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.6.7/docbrain-darwin-amd64"
      sha256 "2ec84cf0b955d11ebbc0ca8aced5e5d156dc59b8c86aea0401d70cb5abd1c710"
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
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.6.7/docbrain-linux-amd64"
    sha256 "0da2576c57f6dff47bfc38571199cd5db6cd256b1c796cd7e3a160b59914e954"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("\#{bin}/docbrain --help")
  end
end
