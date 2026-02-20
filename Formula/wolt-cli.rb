# typed: false
# frozen_string_literal: true

class WoltCli < Formula
  desc "Unofficial community CLI for interacting with Wolt APIs"
  homepage "https://github.com/mekedron/wolt-cli"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.5.0/wolt_v0.5.0_darwin_amd64.tar.gz"
      sha256 "b689bbb7ebd9ded274cf683781530013d8bc83cdf33cc027933a9e1162584151"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.5.0/wolt_v0.5.0_darwin_arm64.tar.gz"
      sha256 "5b75eff5f626ae9d57086f8dd6d929b8070cd3598251f7c7ca357c72f0a4783f"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.5.0/wolt_v0.5.0_linux_amd64.tar.gz"
      sha256 "c392e381d73a235ee038a096d87afcae678b60c21d353b6dab6a4dd71cae2040"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.5.0/wolt_v0.5.0_linux_arm64.tar.gz"
      sha256 "ecc22446851a18b24f41c333571431565e28db7f9c1a5e82991695d80c45c6c9"
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
