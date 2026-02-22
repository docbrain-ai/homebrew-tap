class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "0.1.4"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v0.1.4/docbrain-darwin-arm64"
      sha256 "533704e8c53548db12a16e9a1e1aa6d09d9da75fe2c2b3293ade4fbda378d732"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v0.1.4/docbrain-darwin-amd64"
      sha256 "5d3ec71c3841f1acf315b783cba2d3dd73d5e732dad7bc9f3f7d86246c17512a"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v0.1.4/docbrain-linux-amd64"
    sha256 "d8649f636ca79c95f41ab9a95af52c688e1a95dee158eced61ea5473fe7540d7"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("\#{bin}/docbrain --help")
  end
end
