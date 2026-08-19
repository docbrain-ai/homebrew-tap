class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.5.14"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.14/docbrain-darwin-arm64"
      sha256 "7db9358f31f134294628c87ff735d6504208546ad5a0cefa873b8aebfce64d28"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.14/docbrain-darwin-amd64"
      sha256 "f3324306530a8bbf0f99d906e31a5c5c15d840e4e36234572894738422a3d5e9"
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
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.14/docbrain-linux-amd64"
    sha256 "4a72879191c64cce21bee90178daa79fbe6c48d86b0834aa10c13248fafff943"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("\#{bin}/docbrain --help")
  end
end
