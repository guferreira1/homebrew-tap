class Specharbor < Formula
  desc "CLI for OpenSpec/SDD agent workflows"
  homepage "https://github.com/guferreira1/spec-harbor"
  version "0.1.0"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/guferreira1/spec-harbor/releases/download/v0.1.0/specharbor_Darwin_arm64.tar.gz"
      sha256 "e8a9a8e131531f87c71af41255009c91546566c788d5ebb28f26bbdcaecdf166"
    end

    on_intel do
      url "https://github.com/guferreira1/spec-harbor/releases/download/v0.1.0/specharbor_Darwin_x86_64.tar.gz"
      sha256 "f5f4f03b5a8c94af39e64832daaa6f56c88952ee406936900e7960361517f548"
    end
  end

  def install
    bin.install "specharbor"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/specharbor version")
  end
end
