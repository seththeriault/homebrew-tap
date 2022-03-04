class CpdfDirect < Formula
  desc "Coherent PDF CLI tools binaries"
  homepage "https://github.com/coherentgraphics/cpdf-binaries"
  version "2.5.1"

  on_macos do
    conflicts_with "cpdf", because: "you should try the version in oncletom/brew first"
    if Hardware::CPU.intel?
      url "https://github.com/coherentgraphics/cpdf-binaries/raw/master/OSX-Intel/cpdf"
      sha256 "d82be8c8eff64b11a67879f63c7a5742ac34d035a71c5799c8714d9b9a96ba4d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://raw.githubusercontent.com/coherentgraphics/cpdf-binaries/master/Linux-Intel-64bit/cpdf"
      sha256 "4e6e5592afe50cd5f9bac404331fae31d2a86d950001bbb05d867855fadf746b"
    end
  end

  def install
    bin.install "cpdf"
  end

  test do
    system "#{bin}/cpdf", "-version"
  end
end
