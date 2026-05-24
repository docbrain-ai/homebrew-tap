class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.4.10"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.10/docbrain-darwin-arm64"
      sha256 "f0479f4c9696f8f1aabde7bd0932a77f0b9ea7294a0e6ce243273aaa6321746f"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.10/docbrain-darwin-amd64"
      sha256 "ee04cee0583f5e3997d5b3389cb23e15ab43bab9fd8bec42f0322a816ff366c1"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.10/docbrain-linux-amd64"
    sha256 "302160682eaf758650b009866dab39495599b023912b6ccff92f6a2fcf22b7bc"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
