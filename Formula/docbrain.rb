class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.6.3"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.6.3/docbrain-darwin-arm64"
      sha256 "8695f1ce5a6d330dbf99bebc746818d137fd10a10e26110811ab6652fbbca266"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.6.3/docbrain-darwin-amd64"
      sha256 "885e8190178c54ff2af018b2561a6c4334cc57d653796ac6a86d1ceea8e01527"
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
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.6.3/docbrain-linux-amd64"
    sha256 "54542a38353585f4ce821cbad4afb068b47e000956f464acfb2f87d813be20b8"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("\#{bin}/docbrain --help")
  end
end
