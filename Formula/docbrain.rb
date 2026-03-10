class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.0.7"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.0.7/docbrain-darwin-arm64"
      sha256 "cb1cd3e22060ce4e9cf8c482b86508963a3c5185a21641dc5593baae2b37d074"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.0.7/docbrain-darwin-amd64"
      sha256 "3b84d8b521e7d2bcddd228dd01e0d313ae39db7a8a1f2dc56f376aedef7bd4e0"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.0.7/docbrain-linux-amd64"
    sha256 "15197895798bed820c97ccd87703f5fb0045def64ae627f771e94568c0d12237"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
