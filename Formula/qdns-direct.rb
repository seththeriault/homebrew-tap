class QdnsDirect < Formula
  desc "A tiny command line DNS client with support for UDP, TCP, DoT, DoH, DoQ and ODoH."
  homepage "https://github.com/natesales/q"
  version "0.8.2"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/natesales/q/releases/download/v0.8.2/q_0.8.2_darwin_arm64.tar.gz"
      sha256 "cb6387b396b92ab7cab37bf60f53f04ad3ea2d1c66f70d39c577d89243e11663"
    end

    if Hardware::CPU.intel?
      url "https://github.com/natesales/q/releases/download/v0.8.2/q_0.8.2_darwin_amd64.tar.gz"
      sha256 "2bcb03ab98d50019412d2ed027ea8852ff8cfc7131f372cac95ef055297d0b2f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/natesales/q/releases/download/v0.8.2/q_0.8.2_linux_amd64.tar.gz"
      sha256 "fb95a998aaf3a14ebdbd21e6d627737333451fc35e2d9c0fce7fd272fee42fc8"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/natesales/q/releases/download/v0.8.2/q_0.8.2_linux_arm64.tar.gz"
      sha256 "227119fbcfce9cf41658f7dc8ff3289586d3cab9fc703a4426fd11050dbc672f"
    end
  end


  # conflicts with existing but deprecated "q" package, so rename binary
  def install
    bin.install "q"  => "qdns"
  end

end