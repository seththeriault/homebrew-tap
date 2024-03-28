class HurlDirect < Formula
  desc "Run and Test HTTP Requests with plain text and curl"
  homepage "https://hurl.dev"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Orange-OpenSource/hurl/releases/download/4.2.0/hurl-4.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "985945db39031a2b2c0fae2a7bbe046478e32ff719d2f55aba95806ed33c209c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Orange-OpenSource/hurl/releases/download/4.2.0/hurl-4.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fc9789905947c3960b273fb6b8b3548fd35761d9bfcc598feeb3dc5aece625cc"
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
