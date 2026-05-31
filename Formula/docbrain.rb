class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.4.21"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.21/docbrain-darwin-arm64"
      sha256 "fcf987bc03d838628e64910b0ed95388a880d35be2b4a00c3090780e84277013"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.21/docbrain-darwin-amd64"
      sha256 "5e3885b43d068ce96338e9010e5dde3f5ad33d0fdde2a8f0732f70880d531118"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.21/docbrain-linux-amd64"
    sha256 "ecdd91240feab6754723e0861e43b9f24d425e7d263a8e15e1ce4b6f0c208ecb"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
