class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.0.9"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.0.9/docbrain-darwin-arm64"
      sha256 "eccf766a3e9ff61f29971c8bbead07acf30f1abf3e2f93859f4010a6221dbc6a"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.0.9/docbrain-darwin-amd64"
      sha256 "0a08a1238468ff697d4c59106c14b9a9bd78f4ca2b610dce6b9d2d256b927957"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.0.9/docbrain-linux-amd64"
    sha256 "ed8a0f893440c94826a37b8f0ff1816ec0c7c2c2b95c54a19ceca41a7ccbf51b"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
