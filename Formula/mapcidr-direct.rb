class MapcidrDirect < Formula
  desc "Subnet/CIDR operation utility"
  homepage "https://projectdiscovery.io"
  url "https://github.com/projectdiscovery/mapcidr/archive/v1.0.3.tar.gz"
  sha256 "57684ee0ad18c4e96a2b6c3da88d8b22a2413253ff157b20c595a0a5f554136d"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/projectdiscovery/mapcidr/releases/download/v1.0.3/mapcidr_1.0.3_macOS_amd64.tar.gz"
      sha256 "2411161195d8fa6d8acc797f0164b2b93aab84c7da8b0a09336f3c51267131f6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/projectdiscovery/mapcidr/releases/download/v1.0.3/mapcidr_1.0.3_linux_amd64.tar.gz"
      sha256 "7db1d99f22c6d0b178bcff56a81c6fccdc3245f0af5bcdc1e2d1fcb83dfaeaf0"
    end
  end

  conflicts_with "mapcidr", because: "you should try the version in homebrew-core first"

  def install
    bin.install "mapcidr"
  end

  test do
    expected = "192.168.0.0/18\n192.168.64.0/18\n192.168.128.0/18\n192.168.192.0/18\n"
    output = shell_output("#{bin}/mapcidr -cidr 192.168.1.0/16 -sbh 16384 -silent")
    assert_equal expected, output
  end
end
