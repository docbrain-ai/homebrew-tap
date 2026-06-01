class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.4.25"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.25/docbrain-darwin-arm64"
      sha256 "7b6b49deb4375ffda6a91c2aa27d7de5abf655d5530126dec7bfb72ecd95ee1b"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.25/docbrain-darwin-amd64"
      sha256 "85484b6a18efabffc03b216d9b227148646e471e17f3681ed8ea8bab7001d65e"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.25/docbrain-linux-amd64"
    sha256 "6eff13594905ca97e2a7949b1b666c0a1933b84fb6bb7e57127998f9822a930a"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
