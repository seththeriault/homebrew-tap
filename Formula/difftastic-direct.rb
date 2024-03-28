class DifftasticDirect < Formula
  desc "Diff that understands syntax"
  homepage "https://github.com/Wilfred/difftastic"
  version "0.56.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Wilfred/difftastic/releases/download/0.56.1/difft-x86_64-apple-darwin.tar.gz"
      sha256 "289d968397637af1cb954f356b51cf3c55a1543d888859d2f5afdfabea291709"
    end

  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Wilfred/difftastic/releases/download/0.56.1/difft-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2922fd79d294afb159e45ff1bc61e8951cd4e239ecfff668824f7f051397a14d"
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
