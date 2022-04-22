class SecretsDirect < Formula
  desc "A command-line tool to prevent committing secret keys into your source code"
  homepage "https://github.com/sirwart/secrets"
  url "https://github.com/sirwart/secrets/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "ac21742bb8cea7010304fe911d6f40faed5a64f0cb5f3dae9bda1bfe8351c7c7"
  license "MIT"

  depends_on :macos

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/sirwart/secrets/releases/download/v0.1.2/secrets-0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "23a680b15b3ef5f3f6b7b945c06fe1b3720e62da38792ca01a89659ee39f994f"
    end
  end

  on_linux do
    opoo "Not yet available on Linux. See #{homepage} for more information."
  end

  def install
    bin.install "secrets"
  end

end
