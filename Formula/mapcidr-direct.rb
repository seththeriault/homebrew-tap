class MapcidrDirect < Formula
  desc "Subnet/CIDR operation utility"
  homepage "https://projectdiscovery.io"
  url "https://github.com/projectdiscovery/mapcidr/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "52dcf9181d361c444823e64e1a89a9da0e4a3bd8fdf26e0d8a803589fa935289"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/projectdiscovery/mapcidr/releases/download/v1.1.2/mapcidr_1.1.2_macOS_amd64.zip"
      sha256 "479599d397b4897a68f4ba2023b040673efb6ed75b50a38a309a45296d231363"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/projectdiscovery/mapcidr/releases/download/v1.1.2/mapcidr_1.1.2_linux_amd64.zip"
      sha256 "4c164c12dda1f8941dbce6f8e1f41a17a372d55ec79421d6e48630b6c613d7da"
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
