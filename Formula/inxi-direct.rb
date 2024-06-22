class InxiDirect < Formula
  desc "Full featured CLI system information tool"
  homepage "https://smxi.org/docs/inxi.htm"
  url "https://codeberg.org/smxi/inxi/archive/3.3.35-1.tar.gz"
  sha256 "08e43312bc60435d770607c3611f2fa35478ea0f48c60d5d5fd60ab2ee421f2e"

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
