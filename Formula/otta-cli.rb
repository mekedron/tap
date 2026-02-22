# typed: false
# frozen_string_literal: true

class OttaCli < Formula
  desc "CLI for automating workflows around otta.fi time tracking"
  homepage "https://github.com/mekedron/otta-cli"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/otta-cli/releases/download/v0.2.2/otta_v0.2.2_darwin_amd64.tar.gz"
      sha256 "d69a20ce5c28a2583c7c5af92d648dd7a4e7b3beba89abc3b26850be8a888237"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/otta-cli/releases/download/v0.2.2/otta_v0.2.2_darwin_arm64.tar.gz"
      sha256 "d8f079674e7fbe40732ebd682acc5f144a283367df17d08f0481a879784b6efb"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/otta-cli/releases/download/v0.2.2/otta_v0.2.2_linux_amd64.tar.gz"
      sha256 "a675d373ba8d1ab08e4e8258de492c84cccda1e55429676fc0e99973e8a75c6c"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/otta-cli/releases/download/v0.2.2/otta_v0.2.2_linux_arm64.tar.gz"
      sha256 "c27bc6ee820749a2261f65f160c5ecc101d2cebd77e99eca685797c3066e8911"
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
