class TldrShClient < Formula
  desc "A fully-functional POSIX shell client for tldr-pages"
  homepage "https://github.com/raylee/tldr-sh-client"
  version "2022.04.18"
  url "https://raw.githubusercontent.com/raylee/tldr/master/tldr"
  sha256 "2562fa3b85f029ffa3582b896c176762d97fc5f5b865bc409ddcda20ed0272b1"
  license "MIT"

  def install
    bin.install "tldr"
  end

  test do
    system "#{bin}/tldr", "--version"
  end
end
