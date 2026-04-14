class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.3.10"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.10/docbrain-darwin-arm64"
      sha256 "5bba8dd70ab3326be508fb1e7ce098834dbb1ced34f57c1a0c787d3a8ddaa62b"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.10/docbrain-darwin-amd64"
      sha256 "65ce275e2c9cc0209a88381981eab146712780e8816dc765faa754c1aa4dee57"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.10/docbrain-linux-amd64"
    sha256 "0585507ebd5dc87769806f283a3b236facb343d60c5c03c85fd9d05b5744aa87"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
