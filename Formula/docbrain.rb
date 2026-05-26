class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.4.17"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.17/docbrain-darwin-arm64"
      sha256 "01c6e7330e173f348bd7ecdaae92f741308b25e8743835d92e97ca9dfb3ade8b"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.17/docbrain-darwin-amd64"
      sha256 "348e4b2393803352177f328a5577859a1359e7b4e45909754e64bf1178267f66"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.17/docbrain-linux-amd64"
    sha256 "18b7b9d891e21deccd644c8a35e89efdd59ae4fbc6db3947d44d343132e5c522"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
