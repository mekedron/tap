# typed: false
# frozen_string_literal: true

class Ocr < Formula
  desc "Capture a screenshot, OCR it with Tesseract, and copy text to clipboard"
  homepage "https://github.com/mekedron/ocr"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/ocr/releases/download/v1.0.0/ocr_v1.0.0_darwin_amd64.tar.gz"
      sha256 "afa14c5ed48b86e49f83fdf1a9ec1df7aeba0eafde15b297addb8751f7216de1"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/ocr/releases/download/v1.0.0/ocr_v1.0.0_darwin_arm64.tar.gz"
      sha256 "b76622b51c7566714a0691c84c603a674499ea5aed6b4ee89934029a0a0711ea"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/ocr/releases/download/v1.0.0/ocr_v1.0.0_linux_amd64.tar.gz"
      sha256 "abb51ac908c036cd8223e99fe886746259de5bc68e418191c960b5e583bdcc50"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/ocr/releases/download/v1.0.0/ocr_v1.0.0_linux_arm64.tar.gz"
      sha256 "c9b8dbfececdbd7310b06eaf69e07abeb4b992b601be85a8d948c684926fa7ae"
    end
  end

  depends_on "tesseract"

  def install
    bin.install "ocr"
  end

  test do
    output = shell_output("#{bin}/ocr --help")
    assert_match "ocr", output
  end
end
