class RipsecretsDirect < Formula
  desc "A command-line tool to prevent committing secret keys into your source code"
  homepage "https://github.com/sirwart/ripsecrets"
  url "https://github.com/sirwart/ripsecrets/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "c29eb8bc09eb4dcac93ca5083a9be59f62fc82967effe6c50ac297dbe48c2057"
  license "MIT"

  depends_on :macos

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/sirwart/ripsecrets/releases/download/v0.1.3/ripsecrets-0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "c18750da63930042a7c863397585161a9b33b0537b3f3e7676d1ffae0dd622f0"
    end
  end

  on_linux do
    opoo "Not yet available on Linux. See #{homepage} for more information."
  end

  def install
    bin.install "ripsecrets"
  end

end
