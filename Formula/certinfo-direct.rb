class CertinfoDirect < Formula
  desc "Print x509 certificate info."
  homepage "https://github.com/pete911/certinfo"
  version "1.0.37"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/pete911/certinfo/releases/download/v1.0.37/certinfo_1.0.37_darwin_amd64.tar.gz"
      sha256 "5a4ab275559efa8967dc3390cdc21de0ee41b53eec3fea63adfed654403ea3d0"

      def install
        bin.install "certinfo"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/pete911/certinfo/releases/download/v1.0.37/certinfo_1.0.37_darwin_arm64.tar.gz"
      sha256 "3174c8b0b534056b4498b4cabd4d1bbe9b1e44873a1d0be25a37f7b13c117e5b"

      def install
        bin.install "certinfo"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/pete911/certinfo/releases/download/v1.0.37/certinfo_1.0.37_linux_amd64.tar.gz"
        sha256 "3380476b65bb97b43a272c748c445aa783746ddc1014f75e0a9161528f0524f8"

        def install
          bin.install "certinfo"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/pete911/certinfo/releases/download/v1.0.37/certinfo_1.0.37_linux_arm64.tar.gz"
        sha256 "5851281ee445f9b915711665930cda3f32be605bcb84b9c075a8e2c66fe4887f"

        def install
          bin.install "certinfo"
        end
      end
    end
  end

  conflicts_with "certinfo", because: "you should try the version in pete911 first"

  test do
    assert_match /Usage/, shell_output("#{bin}/certinfo -h", 0)
  end
end
