class CurlieDirect < Formula
  desc "Power of curl, ease of use of httpie"
  homepage "https://github.com/rs/curlie"
  url "https://github.com/rs/curlie/archive/refs/tags/v1.8.2.tar.gz"
  sha256 "846ca3c5f2cca60c15eaef24949cf49607f09bdd68cbe9d81a2a026e434fa715"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/rs/curlie/releases/download/v1.8.2/curlie_1.8.2_linux_amd64.tar.gz"
      sha256 "033d39a06d7a4320f923c49b488b89ec415c1901413ae85d26b9f7a09b38f1a1"
      $curlie_binary = "curlie"
    end

  end

  def install
    bin.install "#$curlie_binary" => "curlie"
  end

  conflicts_with "curlie", because: "you should try the version in homebrew-core first"

  test do
    assert_match "httpbin.org",
      shell_output("#{bin}/curlie -X GET httpbin.org/headers 2>&1")
  end
end
