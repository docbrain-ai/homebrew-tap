class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.3.13"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.13/docbrain-darwin-arm64"
      sha256 "24b172f4a184429dfca9add5a41f8b99fbab7715580ed946bba29185b9b9b730"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.13/docbrain-darwin-amd64"
      sha256 "5b81e5643c5011ce22eb4eb336c10fc8c79af1c05601b2913afbd5ec741651fb"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.13/docbrain-linux-amd64"
    sha256 "85a2d3c485c4d0e69bdacffebb8752eacdbd500391ccace0bc6e9b420ab74b89"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
