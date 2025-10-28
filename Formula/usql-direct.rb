class UsqlDirect < Formula
  desc "Universal command-line interface for SQL databases"
  homepage "https://github.com/xo/usql"
  version "0.19.26"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/xo/usql/releases/download/v0.19.26/usql-0.19.26-darwin-amd64.tar.bz2"
      sha256 "b16ad2ca925f4128cb2d7fa56b33f1b60c167a6e99b55c8f1666dd7806976238"
      $usql_binary = "usql"
    end

    if Hardware::CPU.arm?
      url "https://github.com/xo/usql/releases/download/v0.19.26/usql-0.19.26-darwin-arm64.tar.bz2"
      sha256 "7625811b30ba663c318d28524ef6fc593ebec691157b320fe20f4ce35058a853"
      $usql_binary = "usql"
    end

  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/xo/usql/releases/download/v0.19.26/usql_static-0.19.26-linux-amd64.tar.bz2"
      sha256 "d297b53dd7fe42142cba0d755bf5acb8301ae1d7d3d65a430f35d67a2f6a510d"
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
