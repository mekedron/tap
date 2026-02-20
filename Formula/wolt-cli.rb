# typed: false
# frozen_string_literal: true

class WoltCli < Formula
  desc "Unofficial community CLI for interacting with Wolt APIs"
  homepage "https://github.com/mekedron/wolt-cli"
  version "0.5.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.5.4/wolt_v0.5.4_darwin_amd64.tar.gz"
      sha256 "959c922b10f76ee2d7f2d629de32d6d9750b9f3d83fc5a98a1b4971261a69b90"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.5.4/wolt_v0.5.4_darwin_arm64.tar.gz"
      sha256 "69031a81f9e1562edc9c8b45171921779473305beca732e9cb438047b8ae45b2"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.5.4/wolt_v0.5.4_linux_amd64.tar.gz"
      sha256 "86a27aca974269cbeafafafba815e3d65292734d678b65728aff2eb28032f8d2"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.5.4/wolt_v0.5.4_linux_arm64.tar.gz"
      sha256 "912b9ff71e93919a61bb24f1151904fd7684778b4cb99d06ce2f5cf24c43dcca"
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
