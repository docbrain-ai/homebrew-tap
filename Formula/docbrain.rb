class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.2.5"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.2.5/docbrain-darwin-arm64"
      sha256 "d8dcb58c55d372ce5d6da10d4a149a6aabd671b2c1aac6274773557961a9adc1"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.2.5/docbrain-darwin-amd64"
      sha256 "db3712f837256b3981e37b83bedff1d969c5e9f54a13010519cb6b3a39c51363"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.2.5/docbrain-linux-amd64"
    sha256 "bdcab1e970eea067e7c5cae9e1469052143c71181f6be937d528fb5318cfed63"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
