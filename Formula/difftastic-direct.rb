class DifftasticDirect < Formula
  desc "Diff that understands syntax"
  homepage "https://github.com/Wilfred/difftastic"
  version "0.55.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Wilfred/difftastic/releases/download/0.55.0/difft-x86_64-apple-darwin.tar.gz"
      sha256 "4a612c1a53eb70dd8906c989ae1bf12db79abbe2aa46b24fbc8e6ae9d6d34078"
    end

  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Wilfred/difftastic/releases/download/0.55.0/difft-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cd4f3176464dd337c56d323b48a248c1da09a4ab630fbdb42fa3d9baa25b2e2d"
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
