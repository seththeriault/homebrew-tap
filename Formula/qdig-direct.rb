class QdigDirect < Formula
  desc "A tiny command line DNS client with support for UDP, TCP, DoT, DoH, DoQ and ODoH."
  homepage "https://github.com/natesales/q"
  version "0.19.10"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/natesales/q/releases/download/v0.19.10/q_0.19.10_darwin_arm64.tar.gz"
      sha256 "fac9a07cd949988f3797089ee352b0a297f354c2ef953a72c0da4564b0e40a50"
    end

    if Hardware::CPU.intel?
      url "https://github.com/natesales/q/releases/download/v0.19.10/q_0.19.10_darwin_amd64.tar.gz"
      sha256 "a9a49f48f61be0ffd4cf931e5b9e4030d73a599082afd64bdfc9dd2eee0ce651"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/natesales/q/releases/download/v0.19.10/q_0.19.10_linux_amd64.tar.gz"
      sha256 "415c12186ba205054a554e6abf0d57ab0712ba9aef64046d6e3dc4ce774db6b6"
    end
  end


  # conflicts with existing but deprecated "q" package, so rename binary
  def install
    bin.install "q"  => "qdig"
  end

end
