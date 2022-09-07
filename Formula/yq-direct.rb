class YqDirect < Formula
  desc "Process YAML documents from the CLI"
  homepage "https://github.com/mikefarah/yq"
  version "4.27.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mikefarah/yq/releases/download/v4.27.3/yq_darwin_amd64.tar.gz"
      sha256 "60fc3bba1b084d696d8ba550a72687b0254d06fb3b044fe66c5561e6c1b8c8ed"
      $yq_binary = "yq_darwin_amd64"
    end

  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mikefarah/yq/releases/download/v4.27.3/yq_linux_amd64.tar.gz"
      sha256 "e6815ada83b65d9c38dd211f08f9f99c77bac72e7ecf5e82a4cf1e8fb314b0ab"
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
