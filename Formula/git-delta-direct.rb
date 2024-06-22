class GitDeltaDirect < Formula
  desc "Syntax-highlighting pager for git and diff output"
  homepage "https://github.com/dandavison/delta"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dandavison/delta/releases/download/0.17.0/delta-0.17.0-x86_64-apple-darwin.tar.gz"
      sha256 "e8b8107aa0725b7a0deee556c05bb655846f0f49bb8a8ec44cb1f78d4a3274fe"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dandavison/delta/releases/download/0.17.0/delta-0.17.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "95a9c63ff0db00b25ddcbb9cda9c7f89d4cc5fe1542dbd68b42d3a7441acf6e8"
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
