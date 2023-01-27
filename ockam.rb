# Note This file if touched must be updated in ./github/ockam.rb.template
# for release automation to work

class Ockam < Formula
  desc "End-to-end encryption and mutual authentication for distributed applications"
  homepage "https://github.com/build-trust/ockam"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/build-trust/ockam/releases/download/ockam_v0.79.0/ockam.aarch64-apple-darwin"
      sha256 "c20afb64ae7d1be587eb73ce48ea48b2194e438acd2eedef8d8f729b0af2595d"

      def install
        mv "ockam.aarch64-apple-darwin", "ockam"
        bin.install "ockam"
        (bash_completion/"ockam").write `#{bin}/ockam completion --shell bash`
        (fish_completion/"ockam.fish").write `#{bin}/ockam completion --shell fish`
        (zsh_completion/"_ockam").write `#{bin}/ockam completion --shell zsh`
      end
    end

    if Hardware::CPU.intel?
      url "https://github.com/build-trust/ockam/releases/download/ockam_v0.79.0/ockam.x86_64-apple-darwin"
      sha256 "1c495030cd2af425f571b7a2b5f37c8f5378b25e5f4890c45e0ad6582d554d0e"

      def install
        mv "ockam.x86_64-apple-darwin", "ockam"
        bin.install "ockam"
        (bash_completion/"ockam").write `#{bin}/ockam completion --shell bash`
        (fish_completion/"ockam.fish").write `#{bin}/ockam completion --shell fish`
        (zsh_completion/"_ockam").write `#{bin}/ockam completion --shell zsh`
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/build-trust/ockam/releases/download/ockam_v0.79.0/ockam.aarch64-unknown-linux-gnu"
      sha256 "ockam.aarch64-unknown-linux-gnu_sha256_value"

      def install
        mv "ockam.aarch64-unknown-linux-gnu", "ockam"
        bin.install "ockam"
        (bash_completion/"ockam").write `#{bin}/ockam completion --shell bash`
        (fish_completion/"ockam.fish").write `#{bin}/ockam completion --shell fish`
        (zsh_completion/"_ockam").write `#{bin}/ockam completion --shell zsh`
      end
    end

    if Hardware::CPU.intel?
      url "https://github.com/build-trust/ockam/releases/download/ockam_v0.79.0/ockam.x86_64-unknown-linux-gnu"
      sha256 "ockam.x86_64-unknown-linux-gnu_sha256_value"

      def install
        mv "ockam.x86_64-unknown-linux-gnu", "ockam"
        bin.install "ockam"
        (bash_completion/"ockam").write `#{bin}/ockam completion --shell bash`
        (fish_completion/"ockam.fish").write `#{bin}/ockam completion --shell fish`
        (zsh_completion/"_ockam").write `#{bin}/ockam completion --shell zsh`
      end
    end
  end

  test do
    system "ockam", "--version"
    assert_match "ockam_v0.79.0".sub!("_", " "), shell_output("#{bin}/ockam -V")
  end
end
