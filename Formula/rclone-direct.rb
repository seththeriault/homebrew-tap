class RcloneDirect < Formula
  desc "Rsync for cloud storage"
  homepage "https://rclone.org/"
  version "1.65.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/rclone/rclone/releases/download/v1.65.1/rclone-v1.65.1-osx-amd64.zip"
      sha256 "1508bf7cb951181238f77370466220239404cd475472081c8059eb3d74e668cb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/rclone/rclone/releases/download/v1.65.1/rclone-v1.65.1-linux-amd64.zip"
      sha256 "8e325e200b07f05667d65277b96f3c3acd02f54466a3ffbda27a5f4ec5fb8776"
    end
  end

  conflicts_with "rclone", because: "you should try the version in homebrew-core first"

  def install
    bin.install "rclone"
    man1.install "rclone.1"
    system bin/"rclone", "genautocomplete", "bash", "rclone.bash"
    system bin/"rclone", "genautocomplete", "zsh", "_rclone"
    system bin/"rclone", "genautocomplete", "fish", "rclone.fish"
    bash_completion.install "rclone.bash" => "rclone"
    zsh_completion.install "_rclone"
    fish_completion.install "rclone.fish"
  end

  test do
    (testpath/"file1.txt").write "Test!"
    system bin/"rclone", "copy", testpath/"file1.txt", testpath/"dist"
    assert_match File.read(testpath/"file1.txt"), File.read(testpath/"dist/file1.txt")
  end
end
