class GoawkDirect < Formula
  desc "POSIX-compliant AWK interpreter written in Go"
  homepage "https://benhoyt.com/writings/goawk/"
  url "https://github.com/benhoyt/goawk/archive/refs/tags/v1.27.0.tar.gz"
  sha256 "f39d5b3ff50f3c16cbfaaa40eb01ec045092afa66988e9728661c65c0e5d6a93"
  version "1.27.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/benhoyt/goawk/releases/download/v1.27.0/goawk_v1.27.0_darwin_amd64.tar.gz"
      sha256 "b3137b7304d196e7aede85eead3abef92cdd7ae93e05bf2b240a3b898f12e383"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/benhoyt/goawk/releases/download/v1.27.0/goawk_v1.27.0_linux_amd64.tar.gz"
      sha256 "70cfeebdd53d81a436fd4313b843e344be87ab00310519644ad9c67e87d8d29b"
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
