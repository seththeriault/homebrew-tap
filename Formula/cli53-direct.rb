class Cli53Direct < Formula
  desc "Command-line tool for Amazon Route 53"
  homepage "https://github.com/barnybug/cli53"
  version "0.8.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/barnybug/cli53/releases/download/0.8.22/cli53-mac-amd64"
      sha256 "260f9164cb843cb6310be3102b114cf770f9407fbf2e01e1ef6758996874a418"

      def install
        bin.install "cli53-mac-amd64" => "cli53"
      end

    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/barnybug/cli53/releases/download/0.8.22/cli53-linux-amd64"
      sha256 "8134c2964ecd6fa119552f5a67b31fc984f6afdc3a404001a5f22a0a3b9cc7e4"

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
