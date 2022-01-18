class Cli53Direct < Formula
  desc "Command-line tool for Amazon Route 53"
  homepage "https://github.com/barnybug/cli53"
  version "0.8.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/barnybug/cli53/releases/download/0.8.18/cli53-mac-amd64"
      sha256 "951afde3bfdc43f6398729e6aba32b37fd99aad7dba8243494987cfb66d99320"

      def install
        bin.install "cli53-mac-amd64" => "cli53"
      end

    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/barnybug/cli53/releases/download/0.8.18/cli53-linux-amd64"
      sha256 "9afe49aef24e81bdc15f1d57f1e1cbf9f77326b33a2ff376e65da6a7d8ac69e3"

      def install
        bin.install "cli53-linux-amd64" => "cli53"
      end

    end
  end

  conflicts_with "cli53", because: "you should try the version in homebrew-core first"

  test do
    assert_match "list domains", shell_output("#{bin}/cli53 help list")
  end
end
