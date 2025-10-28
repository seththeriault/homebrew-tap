class CpdfDirect < Formula
  desc "Coherent PDF CLI tools binaries"
  homepage "https://github.com/coherentgraphics/cpdf-binaries"
  version "2.8.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/coherentgraphics/cpdf-binaries/raw/master/OSX-Intel/cpdf"
      sha256 "d5fe615b90e5322cb8b3f283d9fe9ad23cc7887a094cab0722f166f4c59ab51c"
    end

    if Hardware::CPU.arm?
      url "https://github.com/coherentgraphics/cpdf-binaries/raw/master/OSX-ARM/cpdf"
      sha256 "b9eb0cf65720be66f3cf895afaca47ac4d688ce1f0f361380b35b197bd59800d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/coherentgraphics/cpdf-binaries/raw/master/Linux-Intel-64bit/cpdf"
      sha256 "ea8be82934fbbc6f7c4d39de0a62acd415214f53049d0b93fe7d801e54d86abf"
    end
  end

  def install
    bin.install "cpdf"
  end

  test do
    system "#{bin}/cpdf", "-version"
  end
end
