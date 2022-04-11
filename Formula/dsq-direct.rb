class DsqDirect < Formula
  desc "CLI tool for running SQL queries against JSON, CSV, Excel, Parquet, and more"
  homepage "https://github.com/multiprocessio/dsq"
  version "0.13.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/multiprocessio/dsq/releases/download/0.13.0/dsq-darwin-x64-0.13.0.zip"
      sha256 "b87129863d9f91820ebed51f0549e22b35716be60bb307fddaa5b3ec865bdd6b"
    end
  end

  on_linux do
    odie "Use homebrew-core formula instead."
  end

  conflicts_with "dsq", because: "you should try the version in homebrew-core first"

  def install
    bin.install "dsq"
  end

  test do
    resource("$HOME/userdata.json") do
      url "https://raw.githubusercontent.com/multiprocessio/dsq/0.10.0/testdata/userdata.json"
      sha256 "6713173f834d9398271554f8be9f2e431d51cdc58f6804cc3f4f725da28ad73e"
    end

    query = "\"SELECT count(*) as c FROM {} WHERE State = 'Maryland'\""
    output = shell_output("#{bin}/dsq ${HOME}/userdata.json #{query}")
    assert_match "[{\"c\":19}]", output
  end
end
