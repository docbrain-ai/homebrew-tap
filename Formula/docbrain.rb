class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.4.5"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.5/docbrain-darwin-arm64"
      sha256 "e82b5c89aa6b63dccc8e20ead65d3c41087832c4a0c9072f53c7238b45b39ab9"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.5/docbrain-darwin-amd64"
      sha256 "5cc6fdf2f6e7917f168440fb810feb0be40fdfbeffe68ecf59462cf756ade453"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.5/docbrain-linux-amd64"
    sha256 "5ec2844c7c5fda7e3b9525cd1ff7def2fdfaafff350f67cadc8a60594a6a2bcd"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
