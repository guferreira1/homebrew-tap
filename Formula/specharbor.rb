class Specharbor < Formula
  desc "Spec-driven workflow CLI for AI coding agents"
  homepage "https://github.com/guferreira1/spec-harbor"
  version "0.3.0"
  url "https://github.com/guferreira1/spec-harbor.git",
      tag: "v0.3.0",
      revision: "8b4f502f5a37a3a74bc5da6c52a08304f5f54e0a"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/guferreira1/spec-harbor/internal/platform/version.Version=#{version}
      -X github.com/guferreira1/spec-harbor/internal/platform/version.Commit=8b4f502f5a37a3a74bc5da6c52a08304f5f54e0a
      -X github.com/guferreira1/spec-harbor/internal/platform/version.Date=2026-06-18T00:11:03Z
      -X github.com/guferreira1/spec-harbor/internal/platform/version.Dirty=false
    ]

    system "go", "build", *std_go_args(ldflags: ldflags.join(" ")), "./cmd/specharbor"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specharbor version")
  end
end
