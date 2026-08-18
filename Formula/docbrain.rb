class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.5.12"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.12/docbrain-darwin-arm64"
      sha256 "7d5e56389d7fbac2ba532f2d64b1b1c9f2496e9a0558e9a4b4887bdb7835fb7a"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.12/docbrain-darwin-amd64"
      sha256 "b126338ec32d287d29c28d47d74f060d51844a1e5ddb746770325e37c1aec152"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.12/docbrain-linux-amd64"
    sha256 "5f13d57ae97ba2a958aa37442d4a4cb3048ce4bc9e22039904ec2773ea2d6aef"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("\#{bin}/docbrain --help")
  end
end
