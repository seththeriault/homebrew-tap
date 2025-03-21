class YtDlpDirect< Formula

  desc "A youtube-dl fork with additional features and fixes"
  homepage "https://github.com/yt-dlp/yt-dlp"
  url "https://github.com/yt-dlp/yt-dlp/releases/download/2025.02.19/yt-dlp"
  sha256 "a18843c75b04756ed1d8e261b54de8b7ddf918f73134175d5acab745455dcbc8"
  license "Unlicense"

  $ytldlp_binary = "yt-dlp"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yt-dlp/yt-dlp/releases/download/2025.02.19/yt-dlp_linux"
      sha256 "a3e45133e1960a2ecc3c575b8470ab0d48a52bd92eb1ee3b4b82698fb9a2fc48"
      $ytldlp_binary = "yt-dlp_linux"
    end

  end

  def install
    bin.install "#$ytldlp_binary" => "yt-dlp"
  end

  conflicts_with "yt-dlp", because: "you should try the version in homebrew-core first"

  test do
    # commit history of homebrew-core repo
    system "#{bin}/yt-dlp", "--simulate", "https://www.youtube.com/watch?v=pOtd1cbOP7k"
    # homebrew playlist
    system "#{bin}/yt-dlp", "--simulate", "--yes-playlist", "https://www.youtube.com/watch?v=pOtd1cbOP7k&list=PLMsZ739TZDoLj9u_nob8jBKSC-mZb0Nhj"
  end
end
