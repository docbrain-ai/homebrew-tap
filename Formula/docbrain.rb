class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.3.0"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.0/docbrain-darwin-arm64"
      sha256 "265b999c3801948e721e44be01db6a4d12df27287c4632a89b08e19a83ec64b0"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.0/docbrain-darwin-amd64"
      sha256 "c90d6fd6b86be930e570c5c42d72f88f5ee198ba1c4304498acb6aff9e4136f5"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.0/docbrain-linux-amd64"
    sha256 "3e984667a006d2093c08f9378121922e92b5184569a6035800b96ee572fcbe15"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
