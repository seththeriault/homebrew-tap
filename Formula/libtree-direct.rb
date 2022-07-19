class LibtreeDirect < Formula
  desc "ldd as a tree"
  homepage "https://github.com/haampie/libtree"
  version "3.1.1"
  url "https://github.com/haampie/libtree/archive/refs/tags/v3.1.1.tar.gz"
  sha256 "6148436f54296945d22420254dd78e1829d60124bb2f5b9881320a6550f73f5c"
  license "MIT"

  depends_on :linux

  on_macos do
    opoo "Not available on MacOS. See #{homepage} for more information."
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/haampie/libtree/releases/download/v3.1.1/libtree_x86_64"
      sha256 "49218482f89648972ea4ef38cf986e85268efd1ce8f27fe14b23124bca009e6f"

      def install
        bin.install "libtree_x86_64" => "libtree"
      end

    end
  end

  test do
    system bin/"libtree", "--version"
  end
end
