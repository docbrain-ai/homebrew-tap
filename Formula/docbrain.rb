class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.4.29"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.29/docbrain-darwin-arm64"
      sha256 "d2a33b5813b7f384e2e19d37cac08f819f90949f5a2adf37fce9653dc6c89817"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.29/docbrain-darwin-amd64"
      sha256 "14eacc119444710b6e8e6bf3308ee82551bac797d7a045098aee37c30820c5b7"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.29/docbrain-linux-amd64"
    sha256 "8bd18cee82a193f47a4d6de086b2f3fadcfda4571e060c3283b9628b39b8491a"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
