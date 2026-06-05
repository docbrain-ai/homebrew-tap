class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.4.27"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.27/docbrain-darwin-arm64"
      sha256 "f16561e2909a5ed9c8b440da61640204657711df58d242c91d006dbb3c553e4a"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.27/docbrain-darwin-amd64"
      sha256 "464c4eda69e064da679bf4e146a45b18f8b5bd3c3ef9a66da6e344efd411c9e5"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.27/docbrain-linux-amd64"
    sha256 "8e5c0b03b91b3d3771653ef50af83709c187c7154c644599c763ebc228ec1899"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
