class QdigDirect < Formula
  desc "A tiny command line DNS client with support for UDP, TCP, DoT, DoH, DoQ and ODoH."
  homepage "https://github.com/natesales/q"
  version "0.9.0"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/natesales/q/releases/download/v0.9.0/q_0.9.0_darwin_arm64.tar.gz"
      sha256 "177864e141b4681a145166ea1260133dc559da751b7fba8e46b1fb90c45a5af5"
    end

    if Hardware::CPU.intel?
      url "https://github.com/natesales/q/releases/download/v0.9.0/q_0.9.0_darwin_amd64.tar.gz"
      sha256 "1f32e017c08263fd1845343f60b264705bfb3d9bc3474f039fd4891c43666ea2"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/natesales/q/releases/download/v0.9.0/q_0.9.0_linux_amd64.tar.gz"
      sha256 "c52732ebdfeba4e8645928beb64dcbd2ae4b715625460b150a925ca04fb4910f"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/natesales/q/releases/download/v0.9.0/q_0.9.0_linux_arm64.tar.gz"
      sha256 "c21ffaf191ca8c0f909874c42bcb3bb9fe538426008950a8abcdc7653fa974b6"
    end
  end


  # conflicts with existing but deprecated "q" package, so rename binary
  def install
    bin.install "q"  => "qdig"
  end

end
