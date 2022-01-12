class CertigoDirect < Formula
  desc "Utility to examine and validate certificates in a variety of formats"
  homepage "https://github.com/square/certigo"
  version "1.14.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
	    url "https://github.com/square/certigo/releases/download/v1.14.1/certigo-darwin-amd64"
      sha256 "76c0acaf463397e4f03b5d47795788c2149d7edff8073f3b1fd06205908459ec"

      def install
        bin.install "certigo-darwin-amd64" => "certigo"
      end

    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/square/certigo/releases/download/v1.14.1/certigo-linux-amd64"
      sha256 "c44f32051476c615d74be834485dd8cce0a7e9cf8f96ad35c826548213b52563"

      def install
        bin.install "certigo-linux-amd64" => "certigo"
      end

    end
  end

  conflicts_with "certigo", because: "you should try the version in homebrew-core first"

  test do
    (testpath/"test.crt").write <<~EOS
      -----BEGIN CERTIFICATE-----
      MIIDLDCCAhQCCQCa74bQsAj2/jANBgkqhkiG9w0BAQsFADBYMQswCQYDVQQGEwJV
      UzELMAkGA1UECBMCQ0ExEDAOBgNVBAoTB2NlcnRpZ28xEDAOBgNVBAsTB2V4YW1w
      bGUxGDAWBgNVBAMTD2V4YW1wbGUtZXhwaXJlZDAeFw0xNjA2MTAyMjE0MTJaFw0x
      NjA2MTEyMjE0MTJaMFgxCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEQMA4GA1UE
      ChMHY2VydGlnbzEQMA4GA1UECxMHZXhhbXBsZTEYMBYGA1UEAxMPZXhhbXBsZS1l
      eHBpcmVkMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAs6JY7Hm/NAsH
      3nuMOOSBno6WmwsTYEw3hk4eyprWiI/NpoiaiZVCGahT8NAKqLDW5t9vgKz6c4ff
      i5/aQ2scichq3QS7pELAYlS4b+ey3dA6hj62MOTTO4Ad5bFbbRZG+Mdm2Ayvl6eV
      6catQhMvxt7aIoY9+bodyIYC1zZVqwQ5sOT+CPLDnxK+GvhoyD2jL/XwZplWiIVL
      oX6eEpKIo/QtB6mSU216F/PuAzl/BJond+RzF9mcxJjdZYZlhwT8+o8oXEMI4vEf
      3yzd+zB/mjuxDJR2iw3bSL+zZr2GV/CsMLG/jmvbpIuyI/p5eTy0alz+iHOiyeCN
      9pgD6jyonwIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQAMUuv/zVYniJ94GdOVcNJ/
      bL3CxR5lo6YB04S425qsVrmOex3IQBL1fUduKSSxh5nF+6nzhRzRrDzp07f9pWHL
      ZHt6rruVhE1Eqt7TKKCtZg0d85lmx5WddL+yWc5cI1UtCohB9+iZDPUBUR9RcszQ
      dGD9PmxnPc9soEcQw/3iNffhMMpLRhPaRW9qtJU8wk16DZunWR8E0Oeq42jVTnb4
      ZiD1Idajj0tj/rT5/M1K/ZLEiOzXVpo/+l/+hoXw9eVnRa2nBwjoiZ9cMuGKUpHm
      YSv7SyFevNwDwcxcAq6uVitKi0YCqHiNZ7Ye3/BGRDUFpK2IASUo8YbXYNyA/6nu
      -----END CERTIFICATE-----
    EOS
    system bin/"certigo", "dump", "test.crt"
  end
end
