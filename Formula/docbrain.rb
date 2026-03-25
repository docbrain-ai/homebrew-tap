class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.3.1"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.1/docbrain-darwin-arm64"
      sha256 "fc9c41b62a479a6ffcfd357b57250119d728c096d57e964437263dbe8d9d2d6f"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.1/docbrain-darwin-amd64"
      sha256 "f00c0db7cecc72793d73de4670dfc1a0cec50ce14a4081b13b562ee98b5ed6e6"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.1/docbrain-linux-amd64"
    sha256 "02605ba649209ba7a9e808d8534e45c28730ff7e0fda96081479df506bc1dabe"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
