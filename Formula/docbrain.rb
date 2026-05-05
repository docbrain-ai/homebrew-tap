class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.3.14"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.14/docbrain-darwin-arm64"
      sha256 "7fa0c1b2ea69efd693de9edfc4aeac20455702f2ed0bca98a1646af742ba96be"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.14/docbrain-darwin-amd64"
      sha256 "88967914388d29d5de66b9410d013059b048713a32dc2eabaf58cca342ed3fd4"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.14/docbrain-linux-amd64"
    sha256 "dda6411ae643f8a2fdd2dcd9baf7d0f1980cc0593d48f26b54d10c543557b533"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
