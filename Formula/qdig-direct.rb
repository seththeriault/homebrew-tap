class QdigDirect < Formula
  desc "A tiny command line DNS client with support for UDP, TCP, DoT, DoH, DoQ and ODoH."
  homepage "https://github.com/natesales/q"
  version "0.11.3"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/natesales/q/releases/download/v0.11.3/q_0.11.3_darwin_arm64.tar.gz:
      sha256 ""b53d1d50a679a2ea48d3cce003710c0239a734c9fc36a0539cfe953979b031eb
    end

    if Hardware::CPU.intel?
      url "https://github.com/natesales/q/releases/download/v0.11.3/q_0.11.3_darwin_amd64.tar.gz"
      sha256 "4f41ca5ee44644e5986c79c96ffb1ff87a242b84a3e08b40b7fdecb6fa077bc4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/natesales/q/releases/download/v0.11.3/q_0.11.3_linux_amd64.tar.gz"
      sha256 "43bc42bd9361445e6b0efd5e6394a158c48bad3a75de98adf736177876d6ebe4"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/natesales/q/releases/download/v0.11.3/q_0.11.3_linux_arm64.tar.gz"
      sha256 "a433c7e47efac64690706466d5070f191a9789ad19c4b7cc74f1dca4d6d96fb0"
    end
  end


  # conflicts with existing but deprecated "q" package, so rename binary
  def install
    bin.install "q"  => "qdig"
  end

end
