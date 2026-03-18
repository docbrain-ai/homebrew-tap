class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.2.0"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.2.0/docbrain-darwin-arm64"
      sha256 "4cb8787c6b09dc3ff27acbf39f597ba82f591732de1f273e6c3895306eeb9f79"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.2.0/docbrain-darwin-amd64"
      sha256 "13150ba327ff20dcd0b54a2d7e10cdb03480fae633602beb2e9c173bde5df1b5"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.2.0/docbrain-linux-amd64"
    sha256 "1bf945454d2174fab2e6da27bfe62f16b880fe97edf4d1d48bdd7d803e615bdc"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
