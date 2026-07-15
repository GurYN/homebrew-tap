class Cove < Formula
  desc "GUI-native terminal IDE written in Go"
  homepage "https://github.com/GurYN/cove-editor"
  url "https://github.com/GurYN/cove-editor/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "edfa54a33ddd461628d544999d9b841cc28961a3abe1dd7c66d18015fafa8c01"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/cove"
  end

  test do
    assert_match "cove", shell_output("#{bin}/cove --version")
  end
end
