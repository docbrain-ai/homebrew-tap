class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.3.17"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.17/docbrain-darwin-arm64"
      sha256 "d68db0299b5152b393fdfeb574ed137c08da431f1ee172cdbf2e09ec739dc10c"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.17/docbrain-darwin-amd64"
      sha256 "80ae072ba013c3378a9e9a32095841ef6b1c0b378c5d338563d5e73334118c8b"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.17/docbrain-linux-amd64"
    sha256 "5f788c10a7fdfd9fd142f586b501634292a66600095ddd86c315a281a10b7d94"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
