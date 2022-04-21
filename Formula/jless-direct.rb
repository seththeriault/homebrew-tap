class JlessDirect < Formula
  desc "Command-line pager for JSON data"
  homepage "https://jless.io/"
  url "https://github.com/PaulJuliusMartinez/jless/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "3f1168c9b2432f7f4fa9dd3c31b55e371ef9d6f822dc98a8cdce5318a112bf2d"
  license "MIT"

  depends_on :macos

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/PaulJuliusMartinez/jless/releases/download/v0.8.0/jless-v0.8.0-x86_64-apple-darwin.zip"
      sha256 "5fdd41584c8c08e811d32b80d5998740fc5235484dd0ce84ad989965f0833968"
    end
  end

  on_linux do
    opoo "Requires glibc 2.29 or greater. Use homebrew-core formula instead or see https://github.com/PaulJuliusMartinez/jless/issues/74 for more information."
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
