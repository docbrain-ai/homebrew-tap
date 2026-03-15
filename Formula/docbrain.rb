class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.1.7"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.7/docbrain-darwin-arm64"
      sha256 "87f95f062d75e4bfd7e946dd0665ece004c9cdc6a096619978f6c9281eed9e8d"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.7/docbrain-darwin-amd64"
      sha256 "473f0d8ebf89c299543c90078764a09e059111f104ebdb1b2083b41ab15e3d83"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.7/docbrain-linux-amd64"
    sha256 "9d673c9677b5d1055806d4f88430571702b6eed5cf1bda43dbd91f889a40f3ff"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
