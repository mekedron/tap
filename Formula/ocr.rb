# typed: false
# frozen_string_literal: true

class Ocr < Formula
  desc "Capture a screenshot, OCR it with Apple Vision, and print text to stdout"
  homepage "https://github.com/mekedron/ocr"
  version "1.0.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.intel?
    url "https://github.com/mekedron/ocr/releases/download/v1.0.0/ocr_v1.0.0_darwin_amd64.tar.gz"
      sha256 "8082687e347065afc32fd76473a8e63c389f7732be72c014f95db43287c3a858"
  end
  if Hardware::CPU.arm?
    url "https://github.com/mekedron/ocr/releases/download/v1.0.0/ocr_v1.0.0_darwin_arm64.tar.gz"
    sha256 "49fac91f507e0b639861f5f27aa44e717c9c2919e3767787b87546694f196031"
  end

  def install
    bin.install "ocr"
  end

  test do
    output = shell_output("#{bin}/ocr --help")
    assert_match "ocr", output
  end
end
