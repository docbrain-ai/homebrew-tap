class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.5.26"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.26/docbrain-darwin-arm64"
      sha256 "2600172c4c677c15c54e7fbc4f1e83666cb0a17b6ddfc60c791b6f08382efa62"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.26/docbrain-darwin-amd64"
      sha256 "c9c2254baee86a844e8f4729eff2936cb40c20c06059eecb8e9867b4f4b35a80"
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
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.26/docbrain-linux-amd64"
    sha256 "9ec32303615f39bb9d686a158af05526980b799b1cb5fe9e6946478b4c822710"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("\#{bin}/docbrain --help")
  end
end
