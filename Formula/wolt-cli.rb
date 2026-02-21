# typed: false
# frozen_string_literal: true

class WoltCli < Formula
  desc "Unofficial community CLI for interacting with Wolt APIs"
  homepage "https://github.com/mekedron/wolt-cli"
  version "0.5.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.5.6/wolt_v0.5.6_darwin_amd64.tar.gz"
      sha256 "f47458563c8fa2a20f8965b0f5dfbc6984aaf5d500720b8c89480bfb984742a3"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.5.6/wolt_v0.5.6_darwin_arm64.tar.gz"
      sha256 "a3a84fb286f43ce844c565a2e1160f88a7629e9ab0b39e91c3f97cc3b017d13f"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.5.6/wolt_v0.5.6_linux_amd64.tar.gz"
      sha256 "f979e162a23b6e2222fcb4d039a2ef32cc91ed3ba2da1ffd57f908fd45f4b8ff"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.5.6/wolt_v0.5.6_linux_arm64.tar.gz"
      sha256 "0bf44e6bd194916e0973c59b6f94b8e1ec039528a0afe083f57cf90361ba7159"
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
