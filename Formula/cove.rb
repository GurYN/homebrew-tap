class Cove < Formula
  desc "GUI-native terminal IDE written in Go"
  homepage "https://github.com/GurYN/cove-editor"
  url "https://github.com/GurYN/cove-editor/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "0ee660b22f671f99035bf1e562f4df8b0933a9b14ea67499d114a6b35706a117"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/cove"
  end

  test do
    assert_match "cove", shell_output("#{bin}/cove --version")
  end
end
