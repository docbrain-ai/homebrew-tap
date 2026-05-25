class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.4.13"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.13/docbrain-darwin-arm64"
      sha256 "9c03b0668b42ea1c84df16704780a56c2d6f14416da8573e3df33830c6f30649"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.13/docbrain-darwin-amd64"
      sha256 "afacb957b5d214d45fb9f73a6f3cc36bae6519ac8adbb39253af3ac810645d7c"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.13/docbrain-linux-amd64"
    sha256 "74c5c3bb61f13723cbf896ca1b24f22a8a841d6f79f46cafc50a200eb3268a33"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
