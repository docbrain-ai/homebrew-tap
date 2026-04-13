class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.3.9"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.9/docbrain-darwin-arm64"
      sha256 "ed9dbbc84b1624c61096420a8217741772e5fbd8e08ff8c8139fe60ea59040f6"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.9/docbrain-darwin-amd64"
      sha256 "009574baadbaa0ddc551b4978c76db732a612fb888c144f618fc82d0e2bd8995"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.9/docbrain-linux-amd64"
    sha256 "5b4eabfb82c083986f565eed3606c987c35b93b7b8731ad40846fc1256a5c785"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
