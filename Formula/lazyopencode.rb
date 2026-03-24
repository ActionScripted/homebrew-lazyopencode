# frozen_string_literal: true

class Lazyopencode < Formula
  desc "Terminal UI for managing opencode sessions"
  homepage "https://github.com/actionscripted/lazyopencode"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/actionscripted/lazyopencode/releases/download/v#{version}/lazyopencode-darwin-amd64"
      sha256 "d14eb4249325c028f633f0bc43723c1a20f7e20921175c2c0c7563192b5c8b0e"
    end

    on_arm do
      url "https://github.com/actionscripted/lazyopencode/releases/download/v#{version}/lazyopencode-darwin-arm64"
      sha256 "601001ed5f556185af5782c6cd8f686d59fefd34dffd6b98aa098aef93196471"
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
