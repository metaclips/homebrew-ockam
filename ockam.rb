# Note This file if touched must be updated in ./github/ockam.rb.template
# for release automation to work

class Ockam < Formula
  desc "End-to-end encryption and mutual authentication for distributed applications"
  homepage "https://github.com/build-trust/ockam"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/build-trust/ockam/releases/download/ockam_v0.61.0/ockam.aarch64-apple-darwin"
      sha256 "6ec95ac48d4ddb13f50755b0d1be794ae58e01f846117716cf91e49f0f001c3e"

      def install
        mv "ockam.aarch64-apple-darwin", "ockam"
        bin.install "ockam"
      end
    end

    if Hardware::CPU.intel?
      url "https://github.com/build-trust/ockam/releases/download/ockam_v0.61.0/ockam.x86_64-apple-darwin"
      sha256 "99499644757bfb9ef9b64e6e44506343e09b653c8fe032a0e4ef8ad821b5e94d"

      def install
        mv "ockam.x86_64-apple-darwin", "ockam"
        bin.install "ockam"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/build-trust/ockam/releases/download/ockam_v0.61.0/ockam.aarch64-unknown-linux-gnu"
      sha256 "af37bbb9b95939b499e93738419b7902c43f69bb034fbfa4ee19480515a8150e"

      def install
        mv "ockam.aarch64-unknown-linux-gnu", "ockam"
        bin.install "ockam"
      end
    end

    if Hardware::CPU.intel?
      url "https://github.com/build-trust/ockam/releases/download/ockam_v0.61.0/ockam.x86_64-unknown-linux-gnu"
      sha256 "df87e1c144f52af1c6828bda7ddf72397b2f45baba8c88dd429ce308591c2f48"

      def install
        mv "ockam.x86_64-unknown-linux-gnu", "ockam"
        bin.install "ockam"
      end
    end
  end

  test do
    system "ockam", "--version"
  end
end
