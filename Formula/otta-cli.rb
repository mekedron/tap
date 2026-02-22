# typed: false
# frozen_string_literal: true

class OttaCli < Formula
  desc "CLI for automating workflows around otta.fi time tracking"
  homepage "https://github.com/mekedron/otta-cli"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/otta-cli/releases/download/v0.1.1/otta_v0.1.1_darwin_amd64.tar.gz"
      sha256 "2e537dc7fe146762b036265b602a30aed6ebc337e562152e759b69c72a5f7f66"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/otta-cli/releases/download/v0.1.1/otta_v0.1.1_darwin_arm64.tar.gz"
      sha256 "db80cc572bc640d6cff983ea71d50c9910ff06e40a757918c39bb9b11739be08"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/otta-cli/releases/download/v0.1.1/otta_v0.1.1_linux_amd64.tar.gz"
      sha256 "fe92a377b95d1c7a46b7d18fdb7f641d6faf18f6b53cfddf61e77228a83613f0"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/otta-cli/releases/download/v0.1.1/otta_v0.1.1_linux_arm64.tar.gz"
      sha256 "3fe6c108b1a2e29adb8068d3ac7aa2ae2641c3484e36643a5417ec73aac72d22"
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
