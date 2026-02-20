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
      sha256 "e5f4045e80e6b8b675fb3a527d11b0326b7e0891e1e335569f06e59997bad692"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.5.1/wolt_v0.5.1_darwin_arm64.tar.gz"
      sha256 "c19b267667edb5f6dba061d3301fac30cd346307d406493a2803b6734ab7f934"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.5.1/wolt_v0.5.1_linux_amd64.tar.gz"
      sha256 "934f048e973f4253c8e5fda16120701f53efa0e27f5aa605cebe2a493d4a239b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v0.5.1/wolt_v0.5.1_linux_arm64.tar.gz"
      sha256 "bff7d06be3e4613c18cb5cfee6b1fbf80dd3211a4b116cecc0c974a8470a721b"
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
