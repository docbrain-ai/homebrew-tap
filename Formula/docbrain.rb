class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.6.4"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.6.4/docbrain-darwin-arm64"
      sha256 "9b759129866010f2492184b5b0422d6ca17effc912b69b543c41bbf43bac4baf"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.6.4/docbrain-darwin-amd64"
      sha256 "bec4ad7e25c2cf4cfb8972a23509b7b826c7f5feb0ce2f9034d774c47787d984"
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
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.6.4/docbrain-linux-amd64"
    sha256 "f16edba800bfa33b927884314e5a4718b64d00517be95a745924df9256ad5022"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("\#{bin}/docbrain --help")
  end
end
