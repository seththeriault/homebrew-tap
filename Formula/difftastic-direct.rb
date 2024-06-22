class DifftasticDirect < Formula
  desc "Diff that understands syntax"
  homepage "https://github.com/Wilfred/difftastic"
  version "0.58.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Wilfred/difftastic/releases/download/0.58.0/difft-x86_64-apple-darwin.tar.gz"
      sha256 "8047dd1ba368085c972f2ba6622b5192c0ad148c166a9ca78eefdaa57855c418"
    end

  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Wilfred/difftastic/releases/download/0.58.0/difft-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b366b6f46af9c2214b8ab405f8495cd630cc9148518383f5d0eb7df29f770b56"
    end

  end

  conflicts_with "difftastic", because: "you should try the version in homebrew-core first"

  def install
    bin.install "difft"
  end

  test do
    (testpath/"a.py").write("print(42)\n")
    (testpath/"b.py").write("print(43)\n")
    expected = <<~EOS
      b.py --- Python
      1 print(42)                             1 print(43)\n
    EOS
    assert_equal expected, shell_output("#{bin}/difft --color never --width 80 a.py b.py")
  end
end
