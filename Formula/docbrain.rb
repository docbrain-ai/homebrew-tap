class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.1.4"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.4/docbrain-darwin-arm64"
      sha256 "65612c90a718fc173cd998623a11f24be967466c4dc94f08c5dd5a437b20521f"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.4/docbrain-darwin-amd64"
      sha256 "df45519fd4ab196cb9c0ff7deba74edf5f0fd851cd390f1c3980c10515219bb0"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.4/docbrain-linux-amd64"
    sha256 "265489fe37064f4b5e3744c098c751a9e92958105c58571f1d58e52488975b08"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
