class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.4.18"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.18/docbrain-darwin-arm64"
      sha256 "bf24756c77b78054524924f183fec19eb444e903f4ab6420ba951d14afc2828c"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.18/docbrain-darwin-amd64"
      sha256 "951aedd7014ac2e14f7fed937319f717f00e96d16f61afdc56ef6c77c7c777ad"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.18/docbrain-linux-amd64"
    sha256 "15c07b1ad58ab2259048155406b87596e2726231329bdbd6071a48c242704902"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
