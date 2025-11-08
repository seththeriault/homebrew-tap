class DifftasticDirect < Formula
  desc "Diff that understands syntax"
  homepage "https://github.com/Wilfred/difftastic"
  version "0.65.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Wilfred/difftastic/releases/download/0.65.0/difft-aarch64-apple-darwin.tar.gz"
      sha256 "b5d565f9586519f7e91799c6e3752b7cacf6110dd855b4cf019816e63c7c7f5f"
    end

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Wilfred/difftastic/releases/download/0.65.0/difft-x86_64-apple-darwin.tar.gz"
      sha256 "69cf21cb0629c63dada7229f6bfe7e91a809335299b25ed14abeb1080547c692"
    end

  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Wilfred/difftastic/releases/download/0.65.0/difft-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7196d3fb8c0c24afcc396085c42c74fcf4e4da1e63e27f5b3cfcaef4b72a844f"
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
