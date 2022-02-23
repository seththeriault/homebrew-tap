class JlessDirect < Formula
  desc "Command-line pager for JSON data"
  homepage "https://jless.io/"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/PaulJuliusMartinez/jless/releases/download/v0.7.2/jless-v0.7.2-x86_64-apple-darwin.zip"
      sha256 "4f5d15bbf2764281dd086949d6472a3f297564f800e95940c03a1efdc610887f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/PaulJuliusMartinez/jless/releases/download/v0.7.2/jless-v0.7.2-x86_64-unknown-linux-gnu.zip"
      sha256 "7f24a80f2c5ec928ea285acb0343c475489b33e210579e5eeaf29bd2403f84a7"
    end
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
