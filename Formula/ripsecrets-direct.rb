class RipsecretsDirect < Formula
  desc "A command-line tool to prevent committing secret keys into your source code"
  homepage "https://github.com/sirwart/ripsecrets"
  url "https://github.com/sirwart/ripsecrets/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "1e3d36b3892d241dfd5e9abd86ddb47f22e6837b89cf9ee44989d6c1271dda2b"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/sirwart/ripsecrets/releases/download/v0.1.5/ripsecrets-0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "0a4458602a14fb5dae2adc07bc2cf7c68e85c101831ec459612a7471b9a951cf"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sirwart/ripsecrets/releases/download/v0.1.5/ripsecrets-0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4d1cec381a218541bfe1a499bacf80d49319c58b0b107d7da322be60a681b00c"
    end
  end

  def install
    bin.install "ripsecrets"
  end

end
