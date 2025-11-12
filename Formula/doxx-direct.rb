class DoxxDirect < Formula
  desc "A fast terminal Excel viewer with an interactive TUI"
  homepage "https://github.com/bgreenwell/doxx"
  version "v0.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bgreenwell/doxx/releases/download/v0.1.2/doxx-macos-arm64.tar.gz"
      sha256 "4997fb8e9528c77c994f3beded4ed7e1cfbc9878549ee7a3d061abd0880bfd16"
    end

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/bgreenwell/doxx/releases/download/v0.1.2/doxx-macos-x86_64.tar.gz"
      sha256 "577ec234f97321dec27a53a5e45324887fce877d64e973f6855ec0642478f162"
    end

  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bgreenwell/doxx/releases/download/v0.1.2/doxx-linux-x86_64.tar.gz"
      sha256 "ce7dfc549f2160b218665600bd1f172fd5e0a0d207e2a072d4ccf985dddcb210"
    end

  end

  conflicts_with "doxx", because: "you should try the version in bgreenwell/doxx first"

  def install
    bin.install "doxx"
  end

  test do
    system bin/"doxx", "--version"
  end
end
