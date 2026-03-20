class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.2.4"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.2.4/docbrain-darwin-arm64"
      sha256 "bc78af1626af419c93aa7c2a9554ee4de511d9a65da873a854384b65c99d9cb9"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.2.4/docbrain-darwin-amd64"
      sha256 "9714b0627ce4b5b083c2800160cf14941d211936cfcdf2bfff26ebab876a2493"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.2.4/docbrain-linux-amd64"
    sha256 "001b54ec862e9676c88748b93963efb0baa80367a0e4f49363a88a44b5d302d9"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
