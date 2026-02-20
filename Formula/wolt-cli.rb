# typed: false
# frozen_string_literal: true

class WoltCli < Formula
  desc "Unofficial community CLI for interacting with Wolt APIs"
  homepage "https://github.com/mekedron/wolt-cli"
  version "0.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.5.2/wolt_v0.5.2_darwin_amd64.tar.gz"
      sha256 "391516f4cec5e24f30e13d16869a161e4b120c675e1e4c978e21bc07d19fe290"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.5.2/wolt_v0.5.2_darwin_arm64.tar.gz"
      sha256 "de09c6175d9376b9e374a3c49a140fa04eedef52b621fa14eecced0ef042ac8e"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.5.2/wolt_v0.5.2_linux_amd64.tar.gz"
      sha256 "a299e6eec82c33cca7a7cfd37a9bfe260c593694609693c6597c87a0967ce06c"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.5.2/wolt_v0.5.2_linux_arm64.tar.gz"
      sha256 "2acea7eef8e92466334677728276602ce317e65eb861178e5033e4ef0c398634"
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
