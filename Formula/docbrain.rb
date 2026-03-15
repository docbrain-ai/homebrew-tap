class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.1.8"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.8/docbrain-darwin-arm64"
      sha256 "2532920730f8b100ed6a94996e418588207bfb0fb789b5d78b8a5984dc4605e6"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.8/docbrain-darwin-amd64"
      sha256 "8be76bcd02cd9703b88489514f94605233527b7990d2d836302f7557cf5bd39d"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.8/docbrain-linux-amd64"
    sha256 "df198ad4119d3dc173b875c35d898cd572e0d9b02f5b10b722ec4ddcb9f842cf"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
