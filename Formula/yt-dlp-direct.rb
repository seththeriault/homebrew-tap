class YtDlpDirect< Formula

  desc "A youtube-dl fork with additional features and fixes"
  homepage "https://github.com/yt-dlp/yt-dlp"
  url "https://github.com/yt-dlp/yt-dlp/releases/download/2022.05.18/yt-dlp"
  sha256 "5205f3f7881da2e242d15bb258a591c8775633abf37635add89b4a6cf7bfb162"
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
