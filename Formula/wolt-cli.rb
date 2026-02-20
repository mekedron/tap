# typed: false
# frozen_string_literal: true

class WoltCli < Formula
  desc "Unofficial community CLI for interacting with Wolt APIs"
  homepage "https://github.com/mekedron/wolt-cli"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.4.0/wolt_v0.4.0_darwin_amd64.tar.gz"
      sha256 "20371a99931d40320c70c1323dd2693b47e87cf500f32eaff9a7b1aba8e122b8"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.4.0/wolt_v0.4.0_darwin_arm64.tar.gz"
      sha256 "2bbec11b37da37cbff5f591db9cec05b804b0421a632e862df742e4caab8774d"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.4.0/wolt_v0.4.0_linux_amd64.tar.gz"
      sha256 "ac84fd4ae5a2136445f429aea54997f1350e1b626a32408fdccf21311ad029e4"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.4.0/wolt_v0.4.0_linux_arm64.tar.gz"
      sha256 "871266bd6e5474cabfa4a0fa4bb349a1bb4794452a752d362ff71b8ee8ecd7ee"
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
