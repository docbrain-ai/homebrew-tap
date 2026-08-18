class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.5.13"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.13/docbrain-darwin-arm64"
      sha256 "3c8f02194d9307534c4fc5ab518b91dd51ac4d4ca7e8c28ddb5852703da3fdb9"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.13/docbrain-darwin-amd64"
      sha256 "a7d9c15457737edbbc41c3358d91f1bdc9b8c3e5a84535e96f921c9dae47e474"
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
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.13/docbrain-linux-amd64"
    sha256 "19682a9ef8ca8cd12247ea739fdae60a5d3087d05c3c563d4b0781007007440c"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("\#{bin}/docbrain --help")
  end
end
