class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.4.22"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.22/docbrain-darwin-arm64"
      sha256 "96cbc30abc4cfece7dd22f24c2ec999e1fd5da64b8e5fe4b245cdca9478f027f"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.22/docbrain-darwin-amd64"
      sha256 "f28de82569c5473c4750f4d791e81911f76052a96b421bfd865a2613d1ab5fa1"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.4.22/docbrain-linux-amd64"
    sha256 "b4047351e2a43280fe606ccbc696103e4a7e9e67829d1415a4bab2753c61a169"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
