class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "0.9.6"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v0.9.6/docbrain-darwin-arm64"
      sha256 "84031090ae90a43c90c4fc94a81bc7f905de0ae2c751ea339bd02727e7302a31"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v0.9.6/docbrain-darwin-amd64"
      sha256 "77d33ef3a438c438b6c6e2b01eb3f6e72aad8530b9b19f69396f384598c62047"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v0.9.6/docbrain-linux-amd64"
    sha256 "df92d6786041887e2979a0a5eb6a36a0237883348592d24182410d6b430c4a2e"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("\#{bin}/docbrain --help")
  end
end
