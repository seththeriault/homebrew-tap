class YtDlpDirect< Formula

  desc "A youtube-dl fork with additional features and fixes"
  homepage "https://github.com/yt-dlp/yt-dlp"
  url "https://github.com/yt-dlp/yt-dlp/releases/download/2023.07.06/yt-dlp"
  sha256 "cedf44a9cf3c241520a692c1006d276e6f434d4d945727c47cb1a70d32953f4a"
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
