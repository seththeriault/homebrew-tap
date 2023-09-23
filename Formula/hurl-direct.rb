class HurlDirect < Formula
  desc "Run and Test HTTP Requests with plain text and curl"
  homepage "https://hurl.dev"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Orange-OpenSource/hurl/releases/download/4.1.0/hurl-4.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "4d4ce802cd331e0003306f1e14935ea31f8b548866e677ce1ebf3f5e9d480bc4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Orange-OpenSource/hurl/releases/download/4.1.0/hurl-4.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9528379f817d118c933afb555d62dd83994503235a0a14fda2dfa5995628ded0"
    end
  end

  conflicts_with "hurl", because: "you should try the version in homebrew-core first"

  def install
    bin.install "hurl"
    bin.install "hurlfmt"
    man1.install "hurl.1.gz"
    man1.install "hurlfmt.1.gz"
  end

  test do
    # Perform a GET request to https://hurl.dev.
    # This requires a network connection, but so does Homebrew in general.
    filename = (testpath/"test.hurl")
    filename.write "GET https://hurl.dev"
    system "#{bin}/hurl", "--color", filename
    system "#{bin}/hurlfmt", "--color", filename
  end
end
