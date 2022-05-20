class GoawkDirect < Formula
  desc "POSIX-compliant AWK interpreter written in Go"
  homepage "https://benhoyt.com/writings/goawk/"
  url "https://github.com/benhoyt/goawk/archive/refs/tags/v1.17.1.tar.gz"
  sha256 "43054fbe53922807d97816be802a39a9485c71369eb74f9ed2c2877dcb4d3629"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/benhoyt/goawk/releases/download/v1.17.1/goawk_v1.17.1_darwin_amd64.tar.gz"
      sha256 "8ef1853cf32c2840a3b3ff1d76d804135cc945e3cb734ccae3ccf9f845b32217"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/benhoyt/goawk/releases/download/v1.17.1/goawk_v1.17.1_linux_amd64.tar.gz"
      sha256 "df85d53f1b070ab44064984344b1012d16a93527158c8c6592d9b65839e797d4"
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
