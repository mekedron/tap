# typed: false
# frozen_string_literal: true

class WoltCli < Formula
  desc "Unofficial community CLI for interacting with Wolt APIs"
  homepage "https://github.com/mekedron/wolt-cli"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/wolt-cli/releases/download/v1.0.0/wolt_v1.0.0_darwin_amd64.tar.gz"
      sha256 "eb2d7444f4f392bed23e9b937a1406426fed33c91fe615819d3225c31de3ffac"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v1.0.0/wolt_v1.0.0_darwin_arm64.tar.gz"
      sha256 "fcee74eb2be524e0fa12c9899a1f589368ce7b2ec99e0b98c5e323d14713a6ae"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v1.0.0/wolt_v1.0.0_linux_amd64.tar.gz"
      sha256 "203ac36ccc151cf4ead1a451a43619a15b306a9de3af7699807151802626cf87"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v1.0.0/wolt_v1.0.0_linux_arm64.tar.gz"
      sha256 "0f05612c014a42e89c19e9a8fbbfd8643b769c5820e92455376823a963472340"
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
