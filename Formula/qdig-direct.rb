class QdigDirect < Formula
  desc "A tiny command line DNS client with support for UDP, TCP, DoT, DoH, DoQ and ODoH."
  homepage "https://github.com/natesales/q"
  version "0.19.2"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/natesales/q/releases/download/v0.19.2/q_0.19.2_darwin_arm64.tar.gz"
      sha256 "e52507b2ef48feaee762f3551b137e501c9ece9f6788129b4f49ffdc3ebd28d6"
    end

    if Hardware::CPU.intel?
      url "https://github.com/natesales/q/releases/download/v0.19.2/q_0.19.2_darwin_amd64.tar.gz"
      sha256 "1a3b71d0eb7943f61a983115a79d2b8178ec66d3577430e60662d8e58950762a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/natesales/q/releases/download/v0.19.2/q_0.19.2_linux_amd64.tar.gz"
      sha256 "e3a0a960592d320eddbef8c4ce2f9df4651fbcb0d9648aa24fbf8f0d7b3aace1"
    end
  end


  # conflicts with existing but deprecated "q" package, so rename binary
  def install
    bin.install "q"  => "qdig"
  end

end
