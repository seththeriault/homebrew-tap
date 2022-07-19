class UsqlDirect < Formula
  desc "Universal command-line interface for SQL databases"
  homepage "https://github.com/xo/usql"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/xo/usql/releases/download/v0.11.0/usql-0.11.0-darwin-amd64.tar.bz2"
      sha256 "0ad91ad6df7e51b89305a2e8c599ac5d33ead93168f941a334518bd7dab92f04"
      $usql_binary = "usql"
    end

  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/xo/usql/releases/download/v0.11.0/usql_static-0.11.0-linux-amd64.tar.bz2"
      sha256 "42ac71980cd1ec83758cdde52724ddd92dec1d24f7d75531a13a584d9680d1ba"
      $usql_binary = "usql_static"
    end

  end

  conflicts_with "usql", because: "you should try the version in homebrew-core first"

  def install
    bin.install "#$usql_binary" => "usql"
  end

  test do
    system bin/"usql", "--version"
  end
end
