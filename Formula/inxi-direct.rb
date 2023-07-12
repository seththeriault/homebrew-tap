class InxiDirect < Formula
  desc "Full featured CLI system information tool"
  homepage "https://smxi.org/docs/inxi.htm"
  url "https://github.com/smxi/inxi/archive/3.3.28-1.tar.gz"
  sha256 "937acf2bc0a1f0890c91cf4d9c7b9d496f009e43f3621fd2b60a30345ff80a14"
  license "GPL-3.0-or-later"

  def install
    bin.install "inxi"
    man1.install "inxi.1"

  end

  conflicts_with "inxi", because: "you should try the version in homebrew-core first"

  test do
    inxi_output = shell_output("#{bin}/inxi")
    uname_r = shell_output("uname -r").strip
    assert_match uname_r.to_str, inxi_output.to_s
  end
end
