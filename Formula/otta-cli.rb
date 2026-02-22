# typed: false
# frozen_string_literal: true

class OttaCli < Formula
  desc "CLI for automating workflows around otta.fi time tracking"
  homepage "https://github.com/mekedron/otta-cli"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/otta-cli/releases/download/v0.2.1/otta_v0.2.1_darwin_amd64.tar.gz"
      sha256 "a1f5cdc4aeda01a8aa3db76006285baa64b28c84970853932b6c284d1a1258b9"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/otta-cli/releases/download/v0.2.1/otta_v0.2.1_darwin_arm64.tar.gz"
      sha256 "b9e1a434fc7d8ddd7def28cd3155bd462f1e017ee5b4df5464fa5a4f2b882564"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/otta-cli/releases/download/v0.2.1/otta_v0.2.1_linux_amd64.tar.gz"
      sha256 "4c33545c10e779a7a9c95cc440f39785ad1c04680e312694f4671c224cd2eb1f"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/otta-cli/releases/download/v0.2.1/otta_v0.2.1_linux_arm64.tar.gz"
      sha256 "2946b7575ddd9bd3c1b34e013c778bd07a0c487c1742d74ce189046a78e23442"
    end
  end

  def install
    bin.install "otta"
  end

  test do
    output = shell_output("#{bin}/otta --help")
    assert_match "otta", output
  end
end
