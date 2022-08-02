# Note This file if touched must be updated in ./github/ockam.rb.template
# for release automation to work

class Ockam < Formula
  desc "End-to-end encryption and mutual authentication for distributed applications"
  homepage "https://github.com/build-trust/ockam"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/build-trust/ockam/releases/download/ockam_v0.68.0/ockam.aarch64-apple-darwin"
      sha256 "f648676413f44187ef04de79286c3b143968927a1a69fe1307717dc2a14e7f73"

      def install
        mv "ockam.aarch64-apple-darwin", "ockam"
        bin.install "ockam"
      end
    end

    if Hardware::CPU.intel?
      url "https://github.com/build-trust/ockam/releases/download/ockam_v0.68.0/ockam.x86_64-apple-darwin"
      sha256 "ffd4597c27a070395a1271373a90186626d0e3245daad84da185f6777f7b3f7a"

      def install
        mv "ockam.x86_64-apple-darwin", "ockam"
        bin.install "ockam"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/build-trust/ockam/releases/download/ockam_v0.68.0/ockam.aarch64-unknown-linux-gnu"
      sha256 "c4ae46f42e8c9b332e5a0708210eedba81575cdb7d68086107419e173335d38b"

      def install
        mv "ockam.aarch64-unknown-linux-gnu", "ockam"
        bin.install "ockam"
      end
    end

    if Hardware::CPU.intel?
      url "https://github.com/build-trust/ockam/releases/download/ockam_v0.68.0/ockam.x86_64-unknown-linux-gnu"
      sha256 "6fe1d9bbacde74afdb9da67c37f5f299ddfc4f2a045473af872c5b46ef044805"

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
