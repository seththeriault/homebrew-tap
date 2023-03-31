class YtDlpDirect< Formula

  desc "A youtube-dl fork with additional features and fixes"
  homepage "https://github.com/yt-dlp/yt-dlp"
  url "https://github.com/yt-dlp/yt-dlp/releases/download/2023.03.04/yt-dlp.exe"
  sha256 "91cad9f121c1f6f0a81b747415c46ecba0ff331ed38cc6433040b4ac7b6e15ca"
  license "Unlicense"

  def install
    bin.install "yt-dlp"
  end

  conflicts_with "yt-dlp", because: "you should try the version in homebrew-core first"

  test do
    # commit history of homebrew-core repo
    system "#{bin}/yt-dlp", "--simulate", "https://www.youtube.com/watch?v=pOtd1cbOP7k"
    # homebrew playlist
    system "#{bin}/yt-dlp", "--simulate", "--yes-playlist", "https://www.youtube.com/watch?v=pOtd1cbOP7k&list=PLMsZ739TZDoLj9u_nob8jBKSC-mZb0Nhj"
  end
end
