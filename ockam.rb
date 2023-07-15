# Note This file if touched must be updated in ./github/ockam.rb.template
# for release automation to work

class Ockam < Formula
  desc "End-to-end encryption and mutual authentication for distributed applications"
  homepage "https://github.com/build-trust/ockam"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/build-trust/ockam/releases/download/ockam_v0.91.0/ockam.aarch64-apple-darwin"
      sha256 "8f225d78175c9201f178d1df5750db9f434d03d581d50b65d882687b852e7c94"

      def install
        bin.install "ockam.aarch64-apple-darwin" => "ockam"
        system "chmod", "+x", bin/"ockam"
        generate_completions_from_executable(bin/"ockam", "completion", "--shell")
      end
    end

    if Hardware::CPU.intel?
      url "https://github.com/build-trust/ockam/releases/download/ockam_v0.91.0/ockam.x86_64-apple-darwin"
      sha256 "8d901412b64c8971a7a5252a3c5b8d4d38051cc4f45aec5d79244d23da8e8a97"

      def install
        bin.install "ockam.x86_64-apple-darwin" => "ockam"
        system "chmod", "+x", bin/"ockam"
        generate_completions_from_executable(bin/"ockam", "completion", "--shell")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/build-trust/ockam/releases/download/ockam_v0.91.0/ockam.aarch64-unknown-linux-musl"
      sha256 "91ce593145c8497f4201f410504ba2e8fbad8936465c68eb8db3ed9b3cfa347e"

      def install
        bin.install "ockam.aarch64-unknown-linux-musl" => "ockam"
        system "chmod", "+x", bin/"ockam"
        generate_completions_from_executable(bin/"ockam", "completion", "--shell")
      end
    end

    if Hardware::CPU.intel?
      url "https://github.com/build-trust/ockam/releases/download/ockam_v0.91.0/ockam.x86_64-unknown-linux-musl"
      sha256 "c2b03f0e39fb4b3b7ba71706177ce401f821263873a00dc5924cbc93f1daa2b4"

      def install
        bin.install "ockam.x86_64-unknown-linux-musl" => "ockam"
        system "chmod", "+x", bin/"ockam"
        generate_completions_from_executable(bin/"ockam", "completion", "--shell")
      end
    end
  end

  test do
    system "ockam", "--version"
  end
end
