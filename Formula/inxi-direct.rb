class InxiDirect < Formula
  desc "Full featured CLI system information tool"
  homepage "https://smxi.org/docs/inxi.htm"
  url "https://github.com/smxi/inxi/archive/3.3.31-2.tar.gz"
  sha256 "ff5d138392ac557e31ede6cf96d73d1b9f972f42f6529d47fec2c51184bff338"

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
