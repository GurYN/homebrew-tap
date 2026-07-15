class Cove < Formula
  desc "GUI-native terminal IDE written in Go"
  homepage "https://github.com/GurYN/cove-editor"
  url "https://github.com/GurYN/cove-editor/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "3ad3b9a430f2e260252c23eb32ec31df1638dfc6c795e0014a5471197b6c4c06"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/cove"
  end

  test do
    assert_match "cove", shell_output("#{bin}/cove --version")
  end
end
