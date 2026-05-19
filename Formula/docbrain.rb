class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.4.3"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.3/docbrain-darwin-arm64"
      sha256 "5ecd78e0e81f28f57be37889984b10ad5673ece85d1ff80365059dde1519bd41"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.3/docbrain-darwin-amd64"
      sha256 "cf0dcf3353e6c471084dddec820246c0782447a3de766f59d7b703508c20b144"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.3/docbrain-linux-amd64"
    sha256 "92ce6d1c2e24b66a222ce34cdbb99df947a46f8d817e0b3c4f608fc0909a962f"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
