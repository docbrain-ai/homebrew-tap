class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.5.9"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.9/docbrain-darwin-arm64"
      sha256 "fa117951564fd7ca002963daa3ead332271e1ef85364b49fb73796f08a569353"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.9/docbrain-darwin-amd64"
      sha256 "f15176e3dd69a0bc290b58bb6bc87a75d940c0623b57fb1e45bcd99b583b4677"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.9/docbrain-linux-amd64"
    sha256 "d99e475090df8cf5bb0532deceaae870ac88ad8856d4543c70e87dd4b39d8eb3"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("\#{bin}/docbrain --help")
  end
end
