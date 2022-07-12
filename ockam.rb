# Note This file if touched must be updated in ./github/ockam.rb.template
# for release automation to work

class Ockam < Formula
  desc "End-to-end encryption and mutual authentication for distributed applications"
  homepage "https://github.com/build-trust/ockam"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/build-trust/ockam/releases/download/ockam_v0.64.0/ockam.aarch64-apple-darwin"
      sha256 "f72eefc172d7ac7a1409965d9fa46ae519d5321bff4196eb52a8d996c07edf65"

      def install
        mv "ockam.aarch64-apple-darwin", "ockam"
        bin.install "ockam"
      end
    end

    if Hardware::CPU.intel?
      url "https://github.com/build-trust/ockam/releases/download/ockam_v0.64.0/ockam.x86_64-apple-darwin"
      sha256 "422b324b588d520fa9213e31b4f12ebaadf5ef9ad4674d5cd10635f6659d8bdf"

      def install
        mv "ockam.x86_64-apple-darwin", "ockam"
        bin.install "ockam"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/build-trust/ockam/releases/download/ockam_v0.64.0/ockam.aarch64-unknown-linux-gnu"
      sha256 "9ad054054c78ea8f45db43839317d769440483284551efa5dd04b8c304188e42"

      def install
        mv "ockam.aarch64-unknown-linux-gnu", "ockam"
        bin.install "ockam"
      end
    end

    if Hardware::CPU.intel?
      url "https://github.com/build-trust/ockam/releases/download/ockam_v0.64.0/ockam.x86_64-unknown-linux-gnu"
      sha256 "b697e5408d2dfe578b73f8854f8f372862939afe7e060d4d14890a9d6aae4ffa"

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
