# frozen_string_literal: true

class Lazyopencode < Formula
  desc "Terminal UI for managing opencode sessions"
  homepage "https://github.com/actionscripted/lazyopencode"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/actionscripted/lazyopencode/releases/download/v#{version}/lazyopencode-darwin-amd64"
      sha256 "362fae473f4c54e19d990fae60646b960230e5b4cb88dfd62a2fcb40a883d871"
    end

    on_arm do
      url "https://github.com/actionscripted/lazyopencode/releases/download/v#{version}/lazyopencode-darwin-arm64"
      sha256 "fd2372eeccd3bce7e0af3b521ee84e83bff659298e463e5a770952e897729ebd"
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
