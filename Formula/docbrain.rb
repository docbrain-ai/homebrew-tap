class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.3.12"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.12/docbrain-darwin-arm64"
      sha256 "7d1916049d20d9b081fe98e1b82821b19ab8dc482fc37d698ad6b5a0c015b65f"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.12/docbrain-darwin-amd64"
      sha256 "c284943e8c0c756db0c340f4428f79396a92a2798ccdc5b4e0f9363df173d8b6"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.12/docbrain-linux-amd64"
    sha256 "9a7906942186720e0ee0c1891779c8cf13d7a57edbb004886c3362f56b3d5d8d"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
