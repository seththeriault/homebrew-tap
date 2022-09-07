class BitwardenCliDirect < Formula
  desc "Secure and free password manager for all of your devices"
  homepage "https://bitwarden.com/"
  version "cli-v2022.8.0"
  license "unknown"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/bitwarden/clients/releases/download/cli-v2022.8.0/bw-macos-2022.8.0.zip"
      sha256 "78866efb3cf6dd61392cb39629a5cb0004b652a92ce96f335ad24bfabbfd5e8c"
    end

  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bitwarden/clients/releases/download/cli-v2022.8.0/bw-linux-2022.8.0.zip"
      sha256 "fe22d03c011f5d45ce94e1367096cc5bf464ec47665dd368764fa099b9c91a16"
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
