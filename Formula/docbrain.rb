class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.5.5"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.5/docbrain-darwin-arm64"
      sha256 "df55c022e6ee6e26e833b4799fb87e14c932b409ef937fb12a2e47198da61103"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.5/docbrain-darwin-amd64"
      sha256 "151f8871705acd9b64913f417f4d86ac9533b3f32294b410d366c51fb2d8c801"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.5/docbrain-linux-amd64"
    sha256 "f4f4584213e71154d7a72c871ef393d05758b11f9b3c3a55da1df87a545e062a"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
