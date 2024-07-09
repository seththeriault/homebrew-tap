class CsvlensDirect < Formula
  desc "Command-line csv viewer"
  homepage "https://github.com/YS-L/csvlens"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/YS-L/csvlens/releases/download/v0.9.1/csvlens-x86_64-apple-darwin.tar.xz"
      sha256 "286c465397552d3500b9c4954dc2c14975396fba8aa3a8bad7b88852322d6ecd"
    end

  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/YS-L/csvlens/releases/download/v0.9.1/csvlens-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "fbf0ac739258c7f52b724511e47470018279f34f5adfdce7d8f880de8d746946"
    end

  end

  conflicts_with "csvlens", because: "you should try the version in homebrew-core first"

  def install
    bin.install "csvlens"
  end

  test do
    require "pty"
    require "io/console"
    (testpath/"test.csv").write("A,B,C\n100,42,300")
    PTY.spawn(bin/"csvlens", "#{testpath}/test.csv", "--echo-column", "B") do |r, w, _pid|
      r.winsize = [10, 10]
      sleep 1
      # Select the column B by pressing enter. The answer 42 should be printed out.
      w.write "\r"
      assert r.read.end_with?("42\r\n")
    rescue Errno::EIO
      # GNU/Linux raises EIO when read is done on closed pty
    end
  end
end
