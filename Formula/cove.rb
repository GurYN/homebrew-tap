class Cove < Formula
  desc "GUI-native terminal IDE written in Go"
  homepage "https://github.com/GurYN/cove-editor"
  url "https://github.com/GurYN/cove-editor/archive/refs/tags/v0.17.0.tar.gz"
  sha256 "41533836a29b374f5fc9272a7548851e6320a26899833bdd226e19c3202a7d03"
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
