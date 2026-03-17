class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.1.11"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.11/docbrain-darwin-arm64"
      sha256 "ff7d2da9c3d9789b3d49afc9370ff0d453c29956ab792cc6a31d8288a35e534a"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.11/docbrain-darwin-amd64"
      sha256 "0aeb10c78a804c80d152eb2326a7e9f20022ab72ae867538f7dbdf6af85ff81b"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.1.11/docbrain-linux-amd64"
    sha256 "7b9ea2ee7bf6ea5ac66e3c59ff5f9ad24d582d8eedd33e144cc4c8974c2e810c"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
