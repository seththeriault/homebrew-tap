class MapcidrDirect < Formula
  desc "Subnet/CIDR operation utility"
  homepage "https://projectdiscovery.io"
  url "https://github.com/projectdiscovery/mapcidr/archive/refs/tags/v1.1.34.tar.gz"
  sha256 "296950c4123d34554a9f0746f1bef074374b7ff778fa5fbcc92a24fe149fe78d"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/projectdiscovery/mapcidr/releases/download/v1.1.34/mapcidr_1.1.34_macOS_amd64.zip"
      sha256 "f604ba2eec22f5d728cfe5c7dc5449cead7d3c7efa9b57a3ea8caa04f593299f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/projectdiscovery/mapcidr/releases/download/v1.1.34/mapcidr_1.1.34_linux_amd64.zip"
      sha256 "0d50011ee910ea8cd8d3edc7d5574de21e139e9901ce3b14ab1cb4b32677b7f0"
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
