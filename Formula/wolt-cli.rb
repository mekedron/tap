# typed: false
# frozen_string_literal: true

class WoltCli < Formula
  desc "Unofficial community CLI for interacting with Wolt APIs"
  homepage "https://github.com/mekedron/wolt-cli"
  version "0.5.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.5.5/wolt_v0.5.5_darwin_amd64.tar.gz"
      sha256 "1ad005b2c69a0c63b80f46e06660d23d00a17c34aec500428a010b38ddcda379"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.5.5/wolt_v0.5.5_darwin_arm64.tar.gz"
      sha256 "44c5fbac81f279206941e0b19c98771ccc28afead85060eed78049fe56988a64"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.5.5/wolt_v0.5.5_linux_amd64.tar.gz"
      sha256 "3956249021bdd16b051a65aaea15e71afa45a3d3a83398600b4d24d4ea39b983"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.5.5/wolt_v0.5.5_linux_arm64.tar.gz"
      sha256 "e14c047924d796f7cc7f645cac26aabe746b4feaefeaedfb71043c2e1891f63b"
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
