class CpdfDirect < Formula
  desc "Coherent PDF CLI tools binaries"
  homepage "https://github.com/coherentgraphics/cpdf-binaries"
  version "2.7"

  on_macos do
    conflicts_with "cpdf", because: "you should try the version in oncletom/brew first"
    if Hardware::CPU.intel?
      url "https://github.com/coherentgraphics/cpdf-binaries/raw/master/OSX-Intel/cpdf"
      sha256 "40303837be3baa6574a6480fee37620565a63ca2cca45fecd623e082736ad983"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/coherentgraphics/cpdf-binaries/raw/master/Linux-Intel-64bit/cpdf"
      sha256 "1a81b0a92c2dba9b5a2720434130fba4023ef5c990bc1833d58fe37a4b5e894b"
    end
  end

  def install
    bin.install "cpdf"
  end

  test do
    system "#{bin}/cpdf", "-version"
  end
end
