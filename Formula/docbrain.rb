class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.5.22"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.22/docbrain-darwin-arm64"
      sha256 "f6a4ea4ab5a739548d884d59d4ddf3635616e162e28a01dd3bf3523cb8419f65"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.22/docbrain-darwin-amd64"
      sha256 "570ccc6ddb94437833b8c0109d85ebd42b6099de4cee603c0ea116b2369a927f"
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
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.22/docbrain-linux-amd64"
    sha256 "c8ce9554dd03b14bca519bf4b4a02ce3abb15c36be9d1d64b815557279243268"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("\#{bin}/docbrain --help")
  end
end
