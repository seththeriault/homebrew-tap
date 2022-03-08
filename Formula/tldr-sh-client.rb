class TldrShClient < Formula
  desc "A fully-functional POSIX shell client for tldr-pages"
  homepage "https://github.com/raylee/tldr-sh-client"
  version "2022.02.15"
  url "https://raw.githubusercontent.com/raylee/tldr/master/tldr"
  sha256 "e01fbab798513a012bf52e196c624577c25c653729fd63f2bebae1c52a20bf82"
  license "MIT"

  def install
    bin.install "tldr"
  end

  test do
    system "#{bin}/tldr", "--version"
  end
end
