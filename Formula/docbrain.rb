class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.4.28"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.28/docbrain-darwin-arm64"
      sha256 "209263df6b7cc386c0c511a3929cd002e8a159ca05e42850113dbef5ac999e22"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.28/docbrain-darwin-amd64"
      sha256 "a9a3ecb3e3b7bb5ae00082f41ae357e99f362e264043c2ec2c8b508c937332a3"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.28/docbrain-linux-amd64"
    sha256 "a5dae37bc0f05993b5eee8ba8df32321bb001397e8b9f56d53d398172acad47d"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
