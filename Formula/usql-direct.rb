class UsqlDirect < Formula
  desc "Universal command-line interface for SQL databases"
  homepage "https://github.com/xo/usql"
  version "0.14.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/xo/usql/releases/download/v0.14.10/usql-0.14.10-darwin-amd64.tar.bz2"
      sha256 "d6d6a67e40c0157a43229181aff3ab69b58d37437e3ab1ec503cd98ccf0b9d60"
      $usql_binary = "usql"
    end

  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/xo/usql/releases/download/v0.14.10/usql-0.14.10-linux-amd64.tar.bz2"
      sha256 "15190c99804e00bae7574b6de11054fa1f6380856c12feddf67c0e667f8492cc"
      $usql_binary = "usql_static"
    end

  end

  def install
    bin.install "#$usql_binary" => "usql"
  end

  test do
    system bin/"usql", "--version"
  end
end
