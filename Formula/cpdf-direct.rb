class CpdfDirect < Formula
  desc "Coherent PDF CLI tools binaries"
  homepage "https://github.com/coherentgraphics/cpdf-binaries"
  version "2.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/coherentgraphics/cpdf-binaries/raw/master/OSX-Intel/cpdf"
      sha256 "8ddd3aac989cca5bdf9734dea233ba026a029d82b0e4fa745c7115de3519ffd8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://raw.githubusercontent.com/coherentgraphics/cpdf-binaries/master/Linux-Intel-64bit/cpdf"
      sha256 "bf81ab62e0067b0c33ee22bec3579aa678760f31131b98fe3c22d4ccffc6bf5c"
    end
  end

  conflicts_with "cpdf", because: "you should try the version in oncletom/brew first"

  def install
    bin.install "cpdf"
  end

  test do
    system "#{bin}/cpdf", "-version"
  end
end
