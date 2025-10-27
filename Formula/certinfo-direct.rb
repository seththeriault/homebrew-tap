class CertinfoDirect < Formula
  desc "Print x509 certificate info."
  homepage "https://github.com/pete911/certinfo"
  version "1.0.38"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/pete911/certinfo/releases/download/v1.0.38/certinfo_1.0.38_darwin_amd64.tar.gz"
      sha256 "cc46eba3ef2aa5e01d8d1c7e0f9d3530bb18d6c9310cd751da60d98b8466d760"

      def install
        bin.install "certinfo"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/pete911/certinfo/releases/download/v1.0.38/certinfo_1.0.38_darwin_arm64.tar.gz"
      sha256 "233405552528009524e1d170850f4744cd1abba9183b1f8ec45e7554e3fe83cd"

      def install
        bin.install "certinfo"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/pete911/certinfo/releases/download/v1.0.38/certinfo_1.0.38_linux_amd64.tar.gz"
        sha256 "3380476b65bb97b43a272c748c445aa783746ddc1014f75e0a9161528f0524f8"

        def install
          bin.install "certinfo"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/pete911/certinfo/releases/download/v1.0.38/certinfo_1.0.38_linux_arm64.tar.gz"
        sha256 "aa7cd2fdd234bcf9d85e002cb067a0996a50395da520359fe4caa34693051223"

        def install
          bin.install "certinfo"
        end
      end
    end
  end

  test do
    assert_match /Usage/, shell_output("#{bin}/certinfo -h", 0)
  end
end
