class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.4.9"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.9/docbrain-darwin-arm64"
      sha256 "d8775167e16f03dabe0a44de9617b4aba071e2616642c2c52d552110205425e3"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.9/docbrain-darwin-amd64"
      sha256 "ed4c56f18ba84a83243c8fc4eabbdd85af2002dcf550a994a08f8770625cd428"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.9/docbrain-linux-amd64"
    sha256 "106444473eb51e9b26bf616eec3bdfdfb5ee7820583abe37b621dcb31401a788"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
