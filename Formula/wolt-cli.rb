# typed: false
# frozen_string_literal: true

class WoltCli < Formula
  desc "Unofficial community CLI for interacting with Wolt APIs"
  homepage "https://github.com/mekedron/wolt-cli"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.5.1/wolt_v0.5.1_darwin_amd64.tar.gz"
      sha256 "efc82f66acac6bd94ac250a1ecc4ba5aa67afebadfaf3062c3d7dafd6fb03ae3"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.5.1/wolt_v0.5.1_darwin_arm64.tar.gz"
      sha256 "fc785921aba44581a9c1f0a9127ff009b8a5a698e1ba4bce4b390e83c21c7ef8"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.5.1/wolt_v0.5.1_linux_amd64.tar.gz"
      sha256 "ff0d901c7cb1e038342af6abb58a5cccd67d15e935ec5ece094bc3c097595d86"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.5.1/wolt_v0.5.1_linux_arm64.tar.gz"
      sha256 "ec19a8bdcfb9401e6a3ef1b8c6e149ad381558d0b8d8cc66b4afaec5b9b417c7"
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
