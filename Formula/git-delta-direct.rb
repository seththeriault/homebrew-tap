class GitDeltaDirect < Formula
  desc "Syntax-highlighting pager for git and diff output"
  homepage "https://github.com/dandavison/delta"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dandavison/delta/releases/download/0.12.1/delta-0.12.1-x86_64-apple-darwin.tar.gz"
      sha256 "9d853c4a11f75b8b604cddf74df12d481d64251eb775d139c53f228df2f5ace3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dandavison/delta/releases/download/0.12.1/delta-0.12.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8b6e8d735850fc3a14c10d8139f2ab19fa6fc17c99c905438d3713a76e3ab079"
    end
  end

  uses_from_macos "zlib"

  conflicts_with "git-delta", because: "both install a `delta` binary"
  conflicts_with "delta", because: "you should try the version in homebrew-core first"

  def install
    bin.install "delta"
  end

  test do
    assert_match "delta #{version}", `#{bin}/delta --version`.chomp
  end
end
