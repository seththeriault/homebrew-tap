class CpdfDirect < Formula
  desc "Coherent PDF CLI tools binaries"
  homepage "https://github.com/coherentgraphics/cpdf-binaries"
  version "2.5"

  on_macos do
    conflicts_with "cpdf", because: "you should try the version in oncletom/brew first"
    if Hardware::CPU.intel?
      url "https://github.com/coherentgraphics/cpdf-binaries/raw/master/OSX-Intel/cpdf"
      sha256 "3cdb2c5ddd0127c6a1906a753a639c6d950e93b41e81fceb2cc6473177ab2257"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://raw.githubusercontent.com/coherentgraphics/cpdf-binaries/master/Linux-Intel-64bit/cpdf"
      sha256 "11d06458df9b0ca86770017d7569d4c42337d22558add0787312a417f9aa9ae2"
    end
  end

  def install
    bin.install "cpdf"
  end

  test do
    system "#{bin}/cpdf", "-version"
  end
end
