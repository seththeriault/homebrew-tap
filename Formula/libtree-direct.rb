class LibtreeDirect < Formula
  desc "ldd as a tree"
  homepage "https://github.com/haampie/libtree"
  url "https://github.com/haampie/libtree/archive/refs/tags/v3.1.0.tar.gz"
  sha256 "8057edb2dd77b0acf6ceab6868741993979dccd41fc41a58bde743f11666d781"
  license "MIT"

  depends_on :linux

  on_macos do
    opoo "Not available on MacOS. See #{homepage} for more information."
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/haampie/libtree/releases/download/v3.1.0/libtree_x86_64"
      sha256 "8d85183200300437b935574f259ed01efce4319eaec8525d87096c698a0f4c70"

      def install
        bin.install "libtree_x86_64" => "libtree"
      end

    end
  end

  test do
    system bin/"libtree", "--version"
  end
end
