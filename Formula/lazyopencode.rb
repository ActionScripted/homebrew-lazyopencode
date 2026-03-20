# frozen_string_literal: true

class Lazyopencode < Formula
  desc "Terminal UI for managing opencode sessions"
  homepage "https://github.com/actionscripted/lazyopencode"
  version "0.0.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/actionscripted/lazyopencode/releases/download/v#{version}/lazyopencode-darwin-amd64"
      sha256 "c0cd72a08ae5211ec0545d4fa4c4ce10f5db009a14bed24e265685cb563898c1"
    end

    on_arm do
      url "https://github.com/actionscripted/lazyopencode/releases/download/v#{version}/lazyopencode-darwin-arm64"
      sha256 "e53bda68fee3ab6275d693961c691eb574bf83b73b88b7c00add4d1bcabd7066"
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
    assert_match version.to_s, shell_output("#{bin}/lazyopencode --version 2>&1", 1)
  end
end
