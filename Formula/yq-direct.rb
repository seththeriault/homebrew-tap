class YqDirect < Formula
  desc "Process YAML documents from the CLI"
  homepage "https://github.com/mikefarah/yq"
  version "4.24.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mikefarah/yq/releases/download/v4.24.2/yq_darwin_amd64.tar.gz"
      sha256 "fd5a3073824f29b443af69cd2494c137e828c76bd9e82070b3b2802ac132a298"
      $yq_binary = "yq_darwin_amd64"
    end

  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mikefarah/yq/releases/download/v4.24.2/yq_linux_amd64.tar.gz"
      sha256 "3eb94f5ff6a49f62eef9c2ad34c62eeb2c6e69e02227cc832d80134d96c16bda"
      $yq_binary = "yq_linux_amd64"
    end

  end

  conflicts_with "yq", because: "you should try the version in homebrew-core first"
  conflicts_with "python-yq", because: "both install `yq` executables"

  def install
    # Install binary
    bin.install "#$yq_binary" => "yq"

    # Install shell completions
    (bash_completion/"yq").write Utils.safe_popen_read(bin/"yq", "shell-completion", "bash")
    (zsh_completion/"_yq").write Utils.safe_popen_read(bin/"yq", "shell-completion", "zsh")
    (fish_completion/"yq.fish").write Utils.safe_popen_read(bin/"yq", "shell-completion", "fish")

    # Install man pages
    man1.install "yq.1"
  end

  test do
    assert_equal "key: cat", shell_output("#{bin}/yq eval --null-input --no-colors '.key = \"cat\"'").chomp
    assert_equal "cat", pipe_output("#{bin}/yq eval \".key\" -", "key: cat", 0).chomp
  end
end
