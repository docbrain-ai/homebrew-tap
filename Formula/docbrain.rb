class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.6.2"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.6.2/docbrain-darwin-arm64"
      sha256 "bd1cc99303a4fa54dc6316d1e1b77c303a66a80bd930adcc48bc481941d50ddd"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.6.2/docbrain-darwin-amd64"
      sha256 "af4d239192ccc31ddc1db1bf80eb60ee10e1a58fc95770b4255faf4aa56824c8"
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
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.6.2/docbrain-linux-amd64"
    sha256 "0a573b5539b416fca86abc05f64dc419865500a8bb902ab41d1da04bac09eb67"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("\#{bin}/docbrain --help")
  end
end
