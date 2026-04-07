class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.3.7"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.7/docbrain-darwin-arm64"
      sha256 "571eef4c203a3a3bc83cf46dd2ffbd1cec06aae19325c2ecd97fb1392c1c417b"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.7/docbrain-darwin-amd64"
      sha256 "3896cc8b50ed48572570172b54068b8aad6693f02a69345265bdbf7b637ff6c7"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.7/docbrain-linux-amd64"
    sha256 "e69e8a56bc507b2f727822ae1fa80d3642d98a0da0640404e1315603a5ea96d1"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
