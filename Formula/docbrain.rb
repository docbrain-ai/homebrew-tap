class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.5.4"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.4/docbrain-darwin-arm64"
      sha256 "2a219d6fd9dc7a45158e075b7a8163fd4aa3017a47c122094edb5ff149df960f"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.4/docbrain-darwin-amd64"
      sha256 "5b74d8bc63398ae6cff2902c44d32fd58084ba89b542aec92809a486146fc775"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.5.4/docbrain-linux-amd64"
    sha256 "519205f26d717b6c6a452077748946c82aa5db27d9f2cd621d6c8afd36bf4377"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
