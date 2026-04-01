class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.3.5"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.5/docbrain-darwin-arm64"
      sha256 "d647249640ec858c96b427afff52d89557acbe329627807294c8150124c99712"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.5/docbrain-darwin-amd64"
      sha256 "33ac106b47f6de8e37273911fe1a262b3b564e9c7359089bf3a4db9a5fdb9501"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.5/docbrain-linux-amd64"
    sha256 "dd2595078a0f9d8456fb18b58a53fbc806de67bec1cb421bdfc2e5103f10fc99"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("\#{bin}/docbrain --help")
  end
end
