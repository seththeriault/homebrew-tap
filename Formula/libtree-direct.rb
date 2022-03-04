class LibtreeDirect < Formula
  desc "ldd as a tree"
  homepage "https://github.com/haampie/libtree"
  version "3.0.3"
  license "MIT"

  on_macos do
    odie "Not available on MacOS. See #{homepage} for more information."
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/haampie/libtree/releases/download/v3.0.3/libtree_x86_64"
      sha256 "22ec893cc34892f88f25e42ba898314a480c7ab8456dcad2bdc1809e0e9d68b0"

      def install
        bin.install "libtree_x86_64" => "libtree"
      end

    end
  end

  test do
    system bin/"libtree", "--version"
  end
end
