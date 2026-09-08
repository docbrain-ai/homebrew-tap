class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.5.23"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.23/docbrain-darwin-arm64"
      sha256 "3c1f1038a8ef11e9cbf2373b51ba0fdf9d96caf7dd537511e311e97899870669"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.23/docbrain-darwin-amd64"
      sha256 "0c656b6c16107ce0007fb4e264128177d63dbc896ba7fe258ca6d1466aa2e5e1"
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
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.23/docbrain-linux-amd64"
    sha256 "09b4d06ddc9ff14a8112bc9e2a5d01e6f0385ed37520686fb13d22f3f129c6c3"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("\#{bin}/docbrain --help")
  end
end
