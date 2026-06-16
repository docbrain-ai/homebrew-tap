class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.5.1"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.1/docbrain-darwin-arm64"
      sha256 "8081775e882e592496005ea9490be09ed0280dd21555301909a805230ba8616c"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.1/docbrain-darwin-amd64"
      sha256 "46354914dd0e56271cd4175549b9b95a71b5c8215acbac6139954140f9732330"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.1/docbrain-linux-amd64"
    sha256 "bc6184904305c6466a6b547f79215029a05b8c16579344e35414b355f89c3756"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
