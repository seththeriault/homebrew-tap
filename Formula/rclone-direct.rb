class RcloneDirect < Formula
  desc "Rsync for cloud storage"
  homepage "https://rclone.org/"
  version "1.58.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/rclone/rclone/releases/download/v1.58.1/rclone-v1.58.1-osx-amd64.zip"
      sha256 "03b104accc26d5aec14088c253ea5a6bba3263ae00fc403737cabceecad9eae9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/rclone/rclone/releases/download/v1.58.1/rclone-v1.58.1-linux-amd64.zip"
      sha256 "135a4a0965cb58eafb07941f2013a82282c44c28fea9595587778e969d9ed035"
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
