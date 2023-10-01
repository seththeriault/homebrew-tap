class BitwardenCliDirect < Formula
  desc "Secure and free password manager for all of your devices"
  homepage "https://bitwarden.com/"
  version "cli-v2023.4.0"
  license "unknown"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/bitwarden/clients/releases/download/cli-v2023.4.0/bw-macos-2023.4.0.zip"
      sha256 "2e973a95cfd5e5c7dcfb53622ace3bfb39b61086a8ba68fa98736f70f457b6f8"
    end

  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bitwarden/clients/releases/download/cli-v2023.4.0/bw-linux-2023.4.0.zip"
      sha256 "7333bf62c228f3347bda1d7c00fb34749df6095b923554726b7c7ff97aa096b7"
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
