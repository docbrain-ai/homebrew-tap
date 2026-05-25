class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.4.11"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.11/docbrain-darwin-arm64"
      sha256 "8e94edbe510b514f805ac8727a9953659134d0c72efb7f792ed62dad2f24c289"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.11/docbrain-darwin-amd64"
      sha256 "6cfe51ca25763b5eeb56a44ad930c0579c71fa1e9a4dec2cd7d58042c13450d6"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.11/docbrain-linux-amd64"
    sha256 "6ac3f3cd6aea39304d120df38e6cfdbbfa886fa35995042b19438305c771d546"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
