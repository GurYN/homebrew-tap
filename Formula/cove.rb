class Cove < Formula
  desc "GUI-native terminal IDE written in Go"
  homepage "https://github.com/GurYN/cove-editor"
  url "https://github.com/GurYN/cove-editor/archive/refs/tags/v0.19.0.tar.gz"
  sha256 "70e5b20c15b8a0f1f39b1c46f3a7431b1044a5d00a01b179d1d9d6f3e4d24be5"
  license "MIT"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "1"
    system "go", "build",
      *std_go_args(ldflags: "-X main.version=v#{version}"),
      "./cmd/cove"
  end

  test do
    assert_match "cove", shell_output("#{bin}/cove --version")
  end
end
