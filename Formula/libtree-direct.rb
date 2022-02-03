class LibtreeDirect < Formula
  desc "ldd as a tree"
  homepage "https://github.com/haampie/libtree"
  version "3.0.2"
  license "MIT"

  on_macos do
    odie "Not available on MacOS. See #{homepage} for more information."
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/haampie/libtree/releases/download/v3.0.2/libtree_x86_64"
      sha256 "9f29b7f0a737034114bb13c8779b743d838616d517cd8a2bae54565e9b4d1f7e"

      def install
        bin.install "libtree_x86_64" => "libtree"
      end

    end
  end

  test do
    system bin/"libtree", "--version"
  end
end
