class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.5.21"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.21/docbrain-darwin-arm64"
      sha256 "af5037bb01e23b8ee43a1fc755df3d6f6bdcd501c5e1742cdd4444f13fbacf76"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.21/docbrain-darwin-amd64"
      sha256 "96d908844aa7ffc92188233c821fd8a597ccec39e3f1cdd814c06942610f2a3c"
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
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.21/docbrain-linux-amd64"
    sha256 "afe96a2adf4eca6cf1425eac368369a7c6d770141f6c6137e6c33f450be7688e"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("\#{bin}/docbrain --help")
  end
end
