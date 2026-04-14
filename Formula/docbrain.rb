class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.3.11"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.11/docbrain-darwin-arm64"
      sha256 "56599ab76b5fc23f3dfb8828493c94d61171fa7db8faec1afc9673d6b9dc906f"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.11/docbrain-darwin-amd64"
      sha256 "eb7665d363dfe9e1ee3d2342976baa09b4a22ae21f6719ed233bbafa3cb78e7a"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.11/docbrain-linux-amd64"
    sha256 "7bb63f292fb8b68733e96678bb62ae3471c064427d311d5ad8b757432485d1a4"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
