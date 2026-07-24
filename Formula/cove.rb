class Cove < Formula
  desc "GUI-native terminal IDE written in Go"
  homepage "https://github.com/GurYN/cove-editor"
  url "https://github.com/GurYN/cove-editor/archive/refs/tags/v0.12.0.tar.gz"
  sha256 "0417119058b1edb6262eb53f3349e636df5abf092b1f504da0c9e4f8c36a8ff4"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build",
      *std_go_args(ldflags: "-s -w -X main.version=v#{version}"),
      "./cmd/cove"
  end

  test do
    assert_match "cove", shell_output("#{bin}/cove --version")
  end
end
