class YqDirect < Formula
  desc "Process YAML documents from the CLI"
  homepage "https://github.com/mikefarah/yq"
  version "4.26.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mikefarah/yq/releases/download/v4.26.1/yq_darwin_amd64.tar.gz"
      sha256 "2ce79cff617258e9ee6be51070714f0e1da9bdbd9046507dd935239d17693cb9"
      $yq_binary = "yq_darwin_amd64"
    end

  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mikefarah/yq/releases/download/v4.26.1/yq_linux_amd64.tar.gz"
      sha256 "4d3afe5ddf170ac7e70f4c23eea2969eca357947b56d5d96b8516bdf9ce56577"
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
