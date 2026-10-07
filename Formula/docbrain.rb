class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.5.29"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.29/docbrain-darwin-arm64"
      sha256 "bd1042eb3f036d9e811bd24d131b2faae3e5b6272655645c3360b73d11515970"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.29/docbrain-darwin-amd64"
      sha256 "5fa345b21b73398cdd9d83685164587b9ca9222ac05564a8307b58a9eaf01fd8"
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
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.29/docbrain-linux-amd64"
    sha256 "2ef004783be954bad632a75e276bf72297c662bc9431a8df0bd208a9545daa83"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("\#{bin}/docbrain --help")
  end
end
