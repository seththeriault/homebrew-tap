class QdnsDirect < Formula
  desc "A tiny command line DNS client with support for UDP, TCP, DoT, DoH, DoQ and ODoH."
  homepage "https://github.com/natesales/q"
  version "0.8.4"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/natesales/q/releases/download/v0.8.4/q_0.8.4_darwin_arm64.tar.gz"
      sha256 "8cce30e464aa89588d73f67a7da729fc83e728f0bf16d824f132e11e783acbd1"
    end

    if Hardware::CPU.intel?
      url "https://github.com/natesales/q/releases/download/v0.8.4/q_0.8.4_darwin_amd64.tar.gz"
      sha256 "80a9f1e57fd4b918be3824091a42b3fc113f0d610222738ff537354269514ae2"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/natesales/q/releases/download/v0.8.4/q_0.8.4_linux_amd64.tar.gz"
      sha256 "0d9819cb5d007ae057db464266d02571e1a9780a97b0cb73a6753cd59d843122"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/natesales/q/releases/download/v0.8.4/q_0.8.4_linux_arm64.tar.gz"
      sha256 "d54621ef5026c35dccb20e6586577536b747d3b20c9b3ad7360c0589c4430901"
    end
  end


  # conflicts with existing but deprecated "q" package, so rename binary
  def install
    bin.install "q"  => "qdns"
  end

end
