# typed: false
# frozen_string_literal: true

class OttaCli < Formula
  desc "CLI for automating workflows around otta.fi time tracking"
  homepage "https://github.com/mekedron/otta-cli"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/otta-cli/releases/download/v0.2.3/otta_v0.2.3_darwin_amd64.tar.gz"
      sha256 "bb313bb47d84034aa63f3c4be5db40488f6eb2636e156a3bcf4fb6c67904cd2a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/otta-cli/releases/download/v0.2.3/otta_v0.2.3_darwin_arm64.tar.gz"
      sha256 "a56e12684ee976bdd5b64bc2f12b42ce4ef3fde1f9fecf4cda7921d06150578d"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/otta-cli/releases/download/v0.2.3/otta_v0.2.3_linux_amd64.tar.gz"
      sha256 "c44c795d51906dd89cdf001394441fbad19d5e8b5c0114faf3f0f87a71ed8f69"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/otta-cli/releases/download/v0.2.3/otta_v0.2.3_linux_arm64.tar.gz"
      sha256 "9b59a52e57ad2d367ad61f664df53119a87c51c0a7a5b656ac1244521e985d43"
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
