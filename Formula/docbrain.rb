class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.1.1"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.1/docbrain-darwin-arm64"
      sha256 "d1a10b212c554521d1be19081e3222b283f9f2268753ca4e8386790bb76049e3"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.1/docbrain-darwin-amd64"
      sha256 "e9f6b286c5bb8fa47512482d6703aa5ef28af6873128348e877b5365d58d395c"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.1/docbrain-linux-amd64"
    sha256 "6520770e0a1ae1788336af5c7260dfc03b9e53246ec880efd1724e759c4f7f5e"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
