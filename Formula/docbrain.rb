class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.5.19"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.19/docbrain-darwin-arm64"
      sha256 "881de73eae93a6b5ca0e4bcf84463f140510a7d0869ec8d712f954480361cbd5"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.19/docbrain-darwin-amd64"
      sha256 "746188d06106864c60f0e0109a6a43d1930fdb831bf7fdad1c8db4bbae51f01c"
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
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.19/docbrain-linux-amd64"
    sha256 "2695ba4668e8bbd576fc845a6c749713941d653d51d421d14e12efc408469396"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("\#{bin}/docbrain --help")
  end
end
