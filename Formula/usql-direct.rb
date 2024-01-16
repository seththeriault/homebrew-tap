class UsqlDirect < Formula
  desc "Universal command-line interface for SQL databases"
  homepage "https://github.com/xo/usql"
  version "0.17.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/xo/usql/releases/download/v0.17.5/usql-0.17.5-darwin-amd64.tar.bz2"
      sha256 "aad209374ac1e4b700f46679a66701c9f8c54d5cd820dcd76308a2cc11bda14f"
      $usql_binary = "usql"
    end

  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/xo/usql/releases/download/v0.17.5/usql_static-0.17.5-linux-amd64.tar.bz2"
      sha256 "76b139dc4d0d708cc4d94f8ccdb52fd1e017c9d712e9606e9274ecfb7b32f439"
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
