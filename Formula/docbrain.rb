class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "0.9.9"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v0.9.9/docbrain-darwin-arm64"
      sha256 "110ee0dae7d909ead5b44763ed669e20134d4b7aa0e0b377ef8a4e9047cfa9a8"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v0.9.9/docbrain-darwin-amd64"
      sha256 "cc01c4c902f96f233605640ebf100ecda7da078591d86e9df17a351285c5412b"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v0.9.9/docbrain-linux-amd64"
    sha256 "ec481d14aea0dadad0f9635cba53e323e6c83addc36fe5ea6b37b4dcfdf86354"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("\#{bin}/docbrain --help")
  end
end
