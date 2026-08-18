class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.5.11"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.11/docbrain-darwin-arm64"
      sha256 "9a23212c6afbd28e07d7bfccfce90769d7589e645ad19a4174872f4e79c06114"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.11/docbrain-darwin-amd64"
      sha256 "f8862a57b0d6e954d55dc428edc34034a4e440b38ddd8c75cddfdbb53d66f6b4"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.11/docbrain-linux-amd64"
    sha256 "a04a9566a10edcf9ceb62a51323750c2557da9730fa5ee2d3ffd686c5698e6d8"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("\#{bin}/docbrain --help")
  end
end
