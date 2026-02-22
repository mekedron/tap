# typed: false
# frozen_string_literal: true

class OttaCli < Formula
  desc "CLI for automating workflows around otta.fi time tracking"
  homepage "https://github.com/mekedron/otta-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/otta-cli/releases/download/v0.1.0/otta_v0.1.0_darwin_amd64.tar.gz"
      sha256 "08d6437fb2b3f9cb6f08f8dc2944200f5ddcc78643b1e054e9055ff99fe8eaa9"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/otta-cli/releases/download/v0.1.0/otta_v0.1.0_darwin_arm64.tar.gz"
      sha256 "2605a774ef41e52513f964b23da42565f4602412b7b4309d5b23d1674fd2e835"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/otta-cli/releases/download/v0.1.0/otta_v0.1.0_linux_amd64.tar.gz"
      sha256 "c9117961ab7a415b7d6b4ffe81908af47589a51da134aee5c09c639f5985cabe"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/otta-cli/releases/download/v0.1.0/otta_v0.1.0_linux_arm64.tar.gz"
      sha256 "bbde34ae0fb68a3e4c807397177406a3193fbf95e1e1714a7a6302486d0d4643"
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
