class RcloneDirect < Formula
  desc "Rsync for cloud storage"
  homepage "https://rclone.org/"
  version "1.59.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/rclone/rclone/releases/download/v1.59.1/rclone-v1.59.1-osx-amd64.zip"
      sha256 "23ce78bdc640ea91a0a6c48688a41bfad3c3b62f85ecdd83cab3680c66b16853"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/rclone/rclone/releases/download/v1.58.1/rclone-v1.58.1-linux-amd64.zip"
      sha256 "4aa58ab0200ea5d75c2256933eeb1da1939fe741ded667c97809a2f64e3dd545"
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
