class DsqDirect < Formula
  desc "CLI tool for running SQL queries against JSON, CSV, Excel, Parquet, and more"
  homepage "https://github.com/multiprocessio/dsq"
  url "https://github.com/multiprocessio/dsq/archive/refs/tags/0.17.0.tar.gz"
  sha256 "e180459c996afa0963497a87ce6f7d7695cbd7ce6ff18067be57436f2b5e6f16"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/multiprocessio/dsq/releases/download/0.17.0/dsq-darwin-x64-0.17.0.zip"
      sha256 "e180459c996afa0963497a87ce6f7d7695cbd7ce6ff18067be57436f2b5e6f16"
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
      url "https://raw.githubusercontent.com/multiprocessio/dsq/0.17.0/testdata/userdata.json"
      sha256 "6713173f834d9398271554f8be9f2e431d51cdc58f6804cc3f4f725da28ad73e"
    end

    query = "\"SELECT count(*) as c FROM {} WHERE State = 'Maryland'\""
    output = shell_output("#{bin}/dsq ${HOME}/userdata.json #{query}")
    assert_match "[{\"c\":19}]", output
  end
end
