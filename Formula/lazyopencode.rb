# frozen_string_literal: true

class Lazyopencode < Formula
  desc "Terminal UI for managing opencode sessions"
  homepage "https://github.com/actionscripted/lazyopencode"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/actionscripted/lazyopencode/releases/download/v#{version}/lazyopencode-darwin-amd64"
      sha256 "603cc62829fc8a66698036a27be279743fa8bf65f8e297719f2c367816be81cb"
    end

    on_arm do
      url "https://github.com/actionscripted/lazyopencode/releases/download/v#{version}/lazyopencode-darwin-arm64"
      sha256 "ebce979d32bf0caead0feb198c60504da19e9ead14fa9feb43ec2eb33e2f4e8b"
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
