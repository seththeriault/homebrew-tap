class RcloneDirect < Formula
  desc "Rsync for cloud storage"
  homepage "https://rclone.org/"
  version "1.60.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/rclone/rclone/releases/download/v1.60.1/rclone-v1.60.1-osx-amd64.zip"
      sha256 "d4aad882569aff9ce3278da721369d41d831bb57284c4e40efe0730243b4b84a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/rclone/rclone/releases/download/v1.60.1/rclone-v1.60.1-linux-amd64.zip"
      sha256 "fd6bc19cc7fadb13538cc109128bf92ef47762a83a3eaf2ab699b03bb2a1fe32"
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
