class UsqlDirect < Formula
  desc "Universal command-line interface for SQL databases"
  homepage "https://github.com/xo/usql"
  version "0.18.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/xo/usql/releases/download/v0.18.1/usql-0.18.1-darwin-amd64.tar.bz2"
      sha256 "d69d7425cf9bd5a37cf232e69703610c34a839869619bb8bfa8677d1c6a0e104"
      $usql_binary = "usql"
    end

  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/xo/usql/releases/download/v0.18.1/usql_static-0.18.1-linux-amd64.tar.bz2"
      sha256 "ea7f1083355321b00ced79cffcf0989ce8b4adf45a9b699646c7ea770d871154"
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
