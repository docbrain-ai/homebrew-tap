class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.4.15"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.15/docbrain-darwin-arm64"
      sha256 "bc51cee375233649c2e6ff2fdd92cfbb1ffb11256e69a6ac0225333752b5eda1"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.15/docbrain-darwin-amd64"
      sha256 "6f4c93fbae5e5badc64b5c40521e56fbfc8a249c38aedce299894ccb63c12d9a"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.15/docbrain-linux-amd64"
    sha256 "7b34fc681e23a2131dfd22878a95bb992b1f5fde728a90af3c3c02146cd37dc3"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
