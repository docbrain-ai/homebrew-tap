class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.4.16"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.16/docbrain-darwin-arm64"
      sha256 "f3ccc611706091c3073c8d7ff587a2f12bd9b343b7b85c8c6265f58234fc0239"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.16/docbrain-darwin-amd64"
      sha256 "bf9a78756a5b953634383d59f4a25d4630b9e3d154527aece8072a0529bf0144"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.16/docbrain-linux-amd64"
    sha256 "56d63c3f92774ba261eda1ed1cc5bd574dc2286e3b8e15e25082b57338dd4cbd"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
