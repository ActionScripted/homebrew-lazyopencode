# frozen_string_literal: true

class Lazyopencode < Formula
  desc "Terminal UI for managing opencode sessions"
  homepage "https://github.com/actionscripted/lazyopencode"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/actionscripted/lazyopencode/releases/download/v#{version}/lazyopencode-darwin-amd64"
      sha256 "70cb4e648ac2dc1a31ca4f830f6c67e153997be45af8361c566f7d46005a577f"
    end

    on_arm do
      url "https://github.com/actionscripted/lazyopencode/releases/download/v#{version}/lazyopencode-darwin-arm64"
      sha256 "352d2edfe1442245d4624a8272815361128060e5f5d7512b8fd3205e3bc2d0d1"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "lazyopencode-darwin-arm64" => "lazyopencode"
    else
      bin.install "lazyopencode-darwin-amd64" => "lazyopencode"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lazyopencode --version")
  end
end
