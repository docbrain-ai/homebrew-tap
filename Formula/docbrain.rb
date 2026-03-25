class Docbrain < Formula
  desc "AI-powered documentation intelligence CLI"
  homepage "https://github.com/docbrain-ai/docbrain"
  version "1.3.3"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.3/docbrain-darwin-arm64"
      sha256 "5a2f287eff59946e281a2a19a361f2c7ed43d3f61a7f4a7f1f59c5d97f64a298"
    else
      url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.3/docbrain-darwin-amd64"
      sha256 "9d28aee36f8097f48623a28ae4d06b8a644d5556687ed7470a13ac19d4d1b02c"
    end
  end

  on_linux do
    url "https://github.com/docbrain-ai/docbrain/releases/download/v1.3.3/docbrain-linux-amd64"
    sha256 "6d1e20442634ed5e96dc527f022170561a8c38e8c8edb01b19ab49ef2fd7881e"
  end

  def install
    binary = stable.url.split("/").last
    bin.install binary => "docbrain"
  end

  test do
    assert_match "docbrain", shell_output("#{bin}/docbrain --help")
  end
end
