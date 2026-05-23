class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.4.6"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.6/docbrain-darwin-arm64"
      sha256 "780fc953c3af4eca73714bcf7664dfec00da93a6d9c73ea5133d17d22d61bc0b"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.6/docbrain-darwin-amd64"
      sha256 "6fd6f1ebc40a47d89e2efefb9f9bc5c88ddb78803ee8603edc73baa2b40223bb"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.6/docbrain-linux-amd64"
    sha256 "6ad65e6cc267b755ae064f73720b7e8a25a7f3a67e94e7746540a923e79204aa"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
