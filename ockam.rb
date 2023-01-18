# Note This file if touched must be updated in ./github/ockam.rb.template
# for release automation to work

class Ockam < Formula
  desc "End-to-end encryption and mutual authentication for distributed applications"
  homepage "https://github.com/build-trust/ockam"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/build-trust/ockam/releases/download/ockam_v0.77.0/ockam.aarch64-apple-darwin"
      sha256 "07c714e55b6751b9f9807dd09ff3c62507111f76aa1dbc38fb2be16de7fcf942"

      def install
        mv "ockam.aarch64-apple-darwin", "ockam"
        bin.install "ockam"
        (bash_completion/"ockam").write `#{bin}/ockam completion --shell bash`
        (fish_completion/"ockam.fish").write `#{bin}/ockam completion --shell fish`
        (zsh_completion/"_ockam").write `#{bin}/ockam completion --shell zsh`
      end
    end

    if Hardware::CPU.intel?
      url "https://github.com/build-trust/ockam/releases/download/ockam_v0.77.0/ockam.x86_64-apple-darwin"
      sha256 "7319af7dea78521b851456d5fd9606c545130c473a5833d77c1af0b5897cbfbd"

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
      url "https://github.com/build-trust/ockam/releases/download/ockam_v0.77.0/ockam.aarch64-unknown-linux-gnu"
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
      url "https://github.com/build-trust/ockam/releases/download/ockam_v0.77.0/ockam.x86_64-unknown-linux-gnu"
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
    assert_match "ockam_v0.77.0".sub!("_", " "), shell_output("#{bin}/ockam -V")
  end
end
