class LibtreeDirect < Formula
  desc "ldd as a tree"
  homepage "https://github.com/haampie/libtree"
  version "3.0.1"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/haampie/libtree/releases/download/v3.0.1/libtree_x86_64"
      sha256 "64b573b5cfadd584c2467bfa50614c78100a83088698ba96b034b17347f4bb28"

      def install
        bin.install "libtree_x86_64" => "libtree"
      end

    end
  end

  test do
    system bin/"libtree", "--version"
  end
end
