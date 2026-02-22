# typed: false
# frozen_string_literal: true

class OttaCli < Formula
  desc "CLI for automating workflows around otta.fi time tracking"
  homepage "https://github.com/mekedron/otta-cli"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/otta-cli/releases/download/v0.2.0/otta_v0.2.0_darwin_amd64.tar.gz"
      sha256 "216ee3305bf05c6182b4c556eb379caf149bc17e187d78878c005f9ef55d2615"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/otta-cli/releases/download/v0.2.0/otta_v0.2.0_darwin_arm64.tar.gz"
      sha256 "8658ca3683774f0ac873624a8937ac083b6325bcf282e9973b530acd8b8ad181"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/otta-cli/releases/download/v0.2.0/otta_v0.2.0_linux_amd64.tar.gz"
      sha256 "8ab3416e97acdf3bd2b688b3e00cc208f61ae8caa4739060ec19b920d2806f9f"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/otta-cli/releases/download/v0.2.0/otta_v0.2.0_linux_arm64.tar.gz"
      sha256 "996b273d357608a6d022aa62940d85a52e5f833f9670d5324a1629e58fd5eb0a"
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
