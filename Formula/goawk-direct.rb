class GoawkDirect < Formula
  desc "POSIX-compliant AWK interpreter written in Go"
  homepage "https://benhoyt.com/writings/goawk/"
  url "https://github.com/benhoyt/goawk/archive/refs/tags/v1.20.0.tar.gz"
  sha256 "c24ef4a9b1c0b416c1aeb786368b36736617c60cfd1f4e871798f5abb2a18e0b"
  version "1.20.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/benhoyt/goawk/releases/download/v1.20.0/goawk_v1.20.0_darwin_amd64.tar.gz"
      sha256 "deda1cb4064d30a195753da7e77b68f826e535f57e7d0ba7eeddab24de4f185a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/benhoyt/goawk/releases/download/v1.20.0/goawk_v1.20.0_linux_amd64.tar.gz"
      sha256 "f9fbf5d01dca42267d8cf0245468068a888e2aeec8cf63a71969bf05c1f391a8"
    end
  end

  def install
    bin.install "goawk"
  end

  conflicts_with "goawk", because: "you should try the version in homebrew-core first"

  test do
    output = pipe_output("#{bin}/goawk '{ gsub(/Macro/, \"Home\"); print }' -", "Macrobrew")
    assert_equal "Homebrew", output.strip
  end
end
