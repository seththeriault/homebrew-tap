class UsqlDirect < Formula
  desc "Universal command-line interface for SQL databases"
  homepage "https://github.com/xo/usql"
  version "0.12.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/xo/usql/releases/download/v0.12.13/usql-0.12.13-darwin-amd64.tar.bz2"
      sha256 "c24614025acac0fdd009f0d314d03108674a8bbde00f46063f6682f1a779ba56"
      $usql_binary = "usql"
    end

  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/xo/usql/releases/download/v0.12.13/usql_static-0.12.13-linux-amd64.tar.bz2"
      sha256 "9efd796fcd6a3d086ab26fed898d1fe5189a0551d707b4dc1b1e17174d77aef5"
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
