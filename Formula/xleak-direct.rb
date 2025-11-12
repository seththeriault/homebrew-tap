class XleakDirect < Formula
  desc "A fast terminal Excel viewer with an interactive TUI"
  homepage "https://github.com/bgreenwell/xleak"
  version "v0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bgreenwell/xleak/releases/download/v0.1.0/xleak-macos-arm64.tar.gz"
      sha256 "bf5cb5b20ea15a2525eb20544d03b70f571add8cc0c0ea7ba5b36b00ffcd5c72"
    end

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/bgreenwell/xleak/releases/download/v0.1.0/xleak-macos-x86_64.tar.gz"
      sha256 "a44cdde53782775a58faaceb5b8e14f0efdb301e12fdf19f5ce3d8a0dfe22d3d"
    end

  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bgreenwell/xleak/releases/download/v0.1.0/xleak-linux-x86_64.tar.gz"
      sha256 "d0a8d40f48a07adca6312f913a11b3367bcd49bf51264fb2bfa8f1238da3d10c"
    end

  end

  conflicts_with "xleak", because: "you should try the version in bgreenwell/xleak first"

  def install
    bin.install "xleak"
  end

  test do
    system bin/"xleak", "--version"
  end
end
