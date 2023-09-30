class QdigDirect < Formula
  desc "A tiny command line DNS client with support for UDP, TCP, DoT, DoH, DoQ and ODoH."
  homepage "https://github.com/natesales/q"
  version "0.12.0"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/natesales/q/releases/download/v0.12.0/q_0.12.0_darwin_arm64.tar.gz"
      sha256 "347a2e0175ef50e47422cd7f3edd1dc7d4904d038b242892558b2d3a79907937"
    end

    if Hardware::CPU.intel?
      url "https://github.com/natesales/q/releases/download/v0.12.0/q_0.12.0_darwin_amd64.tar.gz"
      sha256 "66f90d8d2442a47c76979bcf8c335cd976e7fa537a9c5e461207818d271700ed"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/natesales/q/releases/download/v0.12.0/q_0.12.0_linux_amd64.tar.gz"
      sha256 "5dd3564383d46791530b43493ce36d519b5ff0d43c297369024b867684293337"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/natesales/q/releases/download/v0.12.0/q_0.12.0_linux_arm64.tar.gz"
      sha256 "a007f3d9bd8dd1d1f0c0fbf928d568db147066440febc8d22a99554ea767248f"
    end
  end


  # conflicts with existing but deprecated "q" package, so rename binary
  def install
    bin.install "q"  => "qdig"
  end

end
