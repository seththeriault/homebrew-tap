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
      sha256 "69c0d8661a80297d875fb1f2f5b9da9291515eb0e8b108c8b4eb3f4634bba645"
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
