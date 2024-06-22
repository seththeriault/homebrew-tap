class RipsecretsDirect < Formula
  desc "A command-line tool to prevent committing secret keys into your source code"
  homepage "https://github.com/sirwart/ripsecrets"
  url "https://github.com/sirwart/ripsecrets/archive/refs/tags/v0.1.8.tar.gz"
  sha256 "4d7209605d3babde73092fed955628b0ecf280d8d68633b9056d2f859741109d"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/sirwart/ripsecrets/releases/download/v0.1.8/ripsecrets-0.1.8-x86_64-apple-darwin.tar.gz"
      sha256 "7c33a07023c7607ed2c77469d05c12bc5766f1b5a79278d0cbf137b627908fc1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sirwart/ripsecrets/releases/download/v0.1.8/ripsecrets-0.1.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "726bc64d6a06651f068ceba1ea09e727e12e0d2857dfc132d6838b8b958f5c0b"
    end
  end

  conflicts_with "ripsecrets", because: "you should try the version in homebrew-core first"

  def install
    bin.install "ripsecrets"
  end

end
