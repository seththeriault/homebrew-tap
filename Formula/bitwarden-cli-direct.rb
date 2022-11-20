class BitwardenCliDirect < Formula
  desc "Secure and free password manager for all of your devices"
  homepage "https://bitwarden.com/"
  version "cli-v2022.10.0"
  license "unknown"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/bitwarden/clients/releases/download/cli-v2022.10.0/bw-macos-2022.10.0.zip"
      sha256 "c604a09841435f6388fffc13cb6f772a777041ff2759d24c24e7e7c0687e62de"
    end

  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bitwarden/clients/releases/download/cli-v2022.10.0/bw-linux-2022.10.0.zip"
      sha256 "3a47014de6842264b7d0cdd134e54c7b7e8461e7d353814a8b36f1f4ffc9d997  "
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
