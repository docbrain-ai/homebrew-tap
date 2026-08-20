class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.5.15"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.15/docbrain-darwin-arm64"
      sha256 "5c768811f12c29532c0f27d05f11b032bb961b84c89dfe1724bfafa22c3f98ca"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.15/docbrain-darwin-amd64"
      sha256 "8df1b76de67e3f4df348f1329056f46f37ebec4b648e0223abf4fc4c74df1322"
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
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.15/docbrain-linux-amd64"
    sha256 "50d11d2e9743c04e11d871c847589395d7970221b3ab6135e9688b4e5636fa71"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("\#{bin}/docbrain --help")
  end
end
