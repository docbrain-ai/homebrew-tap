class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.1.6"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.6/docbrain-darwin-arm64"
      sha256 "e9c6d36c707504e4fd55cef582ddc03e6d350a6e6f5f0f5df71e2600aec345c2"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.6/docbrain-darwin-amd64"
      sha256 "ee2a577095980a4ec0099cb6be85f276aec78aa5bc95e4db64f7c2a397526472"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.6/docbrain-linux-amd64"
    sha256 "d63f53bfb5cb698b7de88fc1ccc492c54da9246be6c9c043492261805de91c97"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
