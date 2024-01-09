class QdigDirect < Formula
  desc "A tiny command line DNS client with support for UDP, TCP, DoT, DoH, DoQ and ODoH."
  homepage "https://github.com/natesales/q"
  version "0.19.1"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/natesales/q/releases/download/v0.19.1/q_0.19.1_darwin_arm64.tar.gz"
      sha256 "cc52e3e31d47e46daa6a536ec0a927419547cc2c3df74d978b0b2f116f3f6731"
    end

    if Hardware::CPU.intel?
      url "https://github.com/natesales/q/releases/download/v0.19.1/q_0.19.1_darwin_amd64.tar.gz"
      sha256 "d86fc79d4d5d11ce84212d7664f2885a496c9870aab3b7a42616c08aec7fea38"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/natesales/q/releases/download/v0.19.1/q_0.19.1_linux_amd64.tar.gz"
      sha256 "8f7ec99beab18462f4dc4a90241da738f71dc24371d19243a20a0ec77354bd8f"
    end
  end


  # conflicts with existing but deprecated "q" package, so rename binary
  def install
    bin.install "q"  => "qdig"
  end

end
