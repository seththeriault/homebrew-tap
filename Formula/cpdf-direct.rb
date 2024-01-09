class CpdfDirect < Formula
  desc "Coherent PDF CLI tools binaries"
  homepage "https://github.com/coherentgraphics/cpdf-binaries"
  version "2.6.1"

  on_macos do
    conflicts_with "cpdf", because: "you should try the version in oncletom/brew first"
    if Hardware::CPU.intel?
      url "https://github.com/coherentgraphics/cpdf-binaries/raw/master/OSX-Intel/cpdf"
      sha256 "93654dc277824a437e8bdab112adb7167413067ef2761e4cb53e8cba85344a25"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://raw.githubusercontent.com/coherentgraphics/cpdf-binaries/master/Linux-Intel-64bit/cpdf"
      sha256 "cb2b2c9269e27e8b64d863da73f136a630d67ae59ecd7f331025824c9ac1fa7e"
    end
  end

  def install
    bin.install "cpdf"
  end

  test do
    system "#{bin}/cpdf", "-version"
  end
end
