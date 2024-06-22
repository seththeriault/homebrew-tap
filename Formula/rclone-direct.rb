class RcloneDirect < Formula
  desc "Rsync for cloud storage"
  homepage "https://rclone.org/"
  version "1.66.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/rclone/rclone/releases/download/v1.66.0/rclone-v1.66.0-osx-amd64.zip"
      sha256 "5adb4c5fe0675627461000a63156001301ec7cade966c55c8c4ebcfaeb62c5ae"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/rclone/rclone/releases/download/v1.66.0/rclone-v1.66.0-linux-amd64.zip"
      sha256 "b4d304b1dc76001b1d3bb820ae8d1ae60a072afbd3296be904a3ee00b3d4fab9"
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
