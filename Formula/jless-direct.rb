class JlessDirect < Formula
  desc "Command-line pager for JSON data"
  homepage "https://jless.io/"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/PaulJuliusMartinez/jless/releases/download/v0.8.0/jless-v0.8.0-x86_64-apple-darwin.zip"
      sha256 "5fdd41584c8c08e811d32b80d5998740fc5235484dd0ce84ad989965f0833968"
    end
  end

  on_linux do
    odie "Use homebrew-core formula instead."
  end

  conflicts_with "jless", because: "you should try the version in homebrew-core first"

  def install
    bin.install "jless"
  end

  test do
    (testpath/"example.json").write('{"hello": "world"}')
    res, process = Open3.capture2("#{bin}/jless example.json")
    assert_equal("world", JSON.parse(res)["hello"])
    assert_equal(process.exitstatus, 0)
  end
end
