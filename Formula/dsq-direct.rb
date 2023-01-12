class DsqDirect < Formula
  desc "CLI tool for running SQL queries against JSON, CSV, Excel, Parquet, and more"
  homepage "https://github.com/multiprocessio/dsq"
  url "https://github.com/multiprocessio/dsq/archive/refs/tags/v0.23.0.tar.gz"
  sha256 "02c923f9089399bf66809bedcb3fec27022f11829e0ed2ac9c7ff87f72e85d8d"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/multiprocessio/dsq/releases/download/v0.23.0/dsq-darwin-x64-v0.23.0.zip"
      sha256 "a2d6fb9099bedee1777ebf2779f95b3375e501d3c8af4d5cb8f8cdf7dccfd4d5"
    end
  end

  on_linux do
    opoo "Requires glibc 2.28 or greater. Use homebrew-core formula instead or see #{homepage} for more information."
  end

  conflicts_with "dsq", because: "you should try the version in homebrew-core first"

  def install
    bin.install "dsq"
  end

  test do
    resource("$HOME/userdata.json") do
      url "https://raw.githubusercontent.com/multiprocessio/dsq/v0.23.0/testdata/userdata.json"
      sha256 "6713173f834d9398271554f8be9f2e431d51cdc58f6804cc3f4f725da28ad73e"
    end

    query = "\"SELECT count(*) as c FROM {} WHERE State = 'Maryland'\""
    output = shell_output("#{bin}/dsq ${HOME}/userdata.json #{query}")
    assert_match "[{\"c\":19}]", output
  end
end
