# typed: false
# frozen_string_literal: true

class WoltCli < Formula
  desc "Unofficial community CLI for interacting with Wolt APIs"
  homepage "https://github.com/mekedron/wolt-cli"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.2.1/wolt_v0.2.1_darwin_amd64.tar.gz"
      sha256 "f6241de62ab8a4fef9ff2fa5b4343c44c7b67994e32bf2c6d23a927337654641"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.2.1/wolt_v0.2.1_darwin_arm64.tar.gz"
      sha256 "034798c7dc84b9077ca21517effbf4715154e953161995d03cdf7475e160b52e"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.2.1/wolt_v0.2.1_linux_amd64.tar.gz"
      sha256 "0421e0f7a823f135f56e30d5e38e01622b7882460ec8e888b06f95712f95f813"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.2.1/wolt_v0.2.1_linux_arm64.tar.gz"
      sha256 "f36349e96397e418489f91fa1d1a939467848a1443e86617ed84f53d1d405147"
    end
  end

  def install
    bin.install "wolt"
  end

  test do
    output = shell_output("#{bin}/wolt --help")
    assert_match "wolt", output
  end
end
