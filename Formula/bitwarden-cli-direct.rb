class BitwardenCliDirect < Formula
  desc "Secure and free password manager for all of your devices"
  homepage "https://bitwarden.com/"
  version "cli-v2022.6.2"
  license "unknown"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/bitwarden/clients/releases/download/cli-v2022.6.2/bw-macos-2022.6.2.zip"
      sha256 "4717258d7902b416055598313840c0e6edfd9f7015071f8a9b5b86f0a3165320"
    end

  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bitwarden/clients/releases/download/cli-v2022.6.2/bw-linux-2022.6.2.zip"
      sha256 "7748f7eba801c340a53c9c84c3f83cf369f461561276a2d612fefd163c90a69b"
    end

  end

  conflicts_with "bitwarden-cli", because: "you should try the version in homebrew-core first"

  def install
    bin.install "bw"
  end

  test do
    system bin/"bw", "--version"
  end
end
