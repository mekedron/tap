# typed: false
# frozen_string_literal: true

class WoltCli < Formula
  desc "Unofficial community CLI for interacting with Wolt APIs"
  homepage "https://github.com/mekedron/wolt-cli"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.3.0/wolt_v0.3.0_darwin_amd64.tar.gz"
      sha256 "40670118c2c9a8247d6c2649248e396bcb15544a9aba52f7091fc912a0f844ca"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.3.0/wolt_v0.3.0_darwin_arm64.tar.gz"
      sha256 "5001602a3d533383daf8efe6aeefa57563d68348c28ba840cbb5d790abb87c08"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.3.0/wolt_v0.3.0_linux_amd64.tar.gz"
      sha256 "23742e46d75c846fe37bf634e8872944857ed45e0b2a4720162fda4f591e89d4"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.3.0/wolt_v0.3.0_linux_arm64.tar.gz"
      sha256 "cb9ba06147007a340565de807bc245d7bf0fbee66f8ae0b0085170f5acb01566"
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
