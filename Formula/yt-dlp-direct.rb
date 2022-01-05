class YtDlpDirect< Formula

  desc "A youtube-dl fork with additional features and fixes"
  homepage "https://github.com/yt-dlp/yt-dlp"
  url "https://github.com/yt-dlp/yt-dlp/releases/download/2021.12.27/yt-dlp"
  sha256 "254289d79a896b828720e3120bbdd00e48546009cfabbe5d86fa4bb9f9e77d48"
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
