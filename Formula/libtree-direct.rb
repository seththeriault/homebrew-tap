class LibtreeDirect < Formula
  desc "ldd as a tree"
  homepage "https://github.com/haampie/libtree"
  version "3.1.0"
  license "MIT"

  on_macos do
    odie "Not available on MacOS. See #{homepage} for more information."
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
