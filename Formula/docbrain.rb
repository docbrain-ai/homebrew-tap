class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "0.5.1"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v0.5.1/docbrain-darwin-arm64"
      sha256 "6e24d5459f1c29d078d508ee56e59244f809bcb3474c59de9360a0d90c048e10"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v0.5.1/docbrain-darwin-amd64"
      sha256 "be60ea2f0bbdda02f621548cf7ecd6bd217a9c2ad8d5d7f9ef4a47da8da0d2ea"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v0.5.1/docbrain-linux-amd64"
    sha256 "2c941a9ba8fd6fb07d95ce70323dc651adbcfa4006cb3b570134faa32d56263a"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("\#{bin}/docbrain --help")
  end
end
