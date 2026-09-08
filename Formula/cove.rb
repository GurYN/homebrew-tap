class Cove < Formula
  desc "GUI-native terminal IDE written in Go"
  homepage "https://github.com/GurYN/cove-editor"
  url "https://github.com/GurYN/cove-editor/archive/refs/tags/v0.17.1.tar.gz"
  sha256 "90392e61cc14dde62186cad27aa0bb4dcae6994f9464c02687cfc399feaeed09"
  license "MIT"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "1"
    system "go", "build",
      *std_go_args(ldflags: "-s -w -X main.version=v#{version}"),
      "./cmd/cove"
  end

  test do
    assert_match "cove", shell_output("#{bin}/cove --version")
  end
end
