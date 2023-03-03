# Note This file if touched must be updated in ./github/ockam.rb.template
# for release automation to work

class Ockam < Formula
  desc "End-to-end encryption and mutual authentication for distributed applications"
  homepage "https://github.com/build-trust/ockam"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/build-trust/ockam/releases/download/ockam_v0.82.0/ockam.aarch64-apple-darwin"
      sha256 "2344a4d8b86f5357f25be90750a59652a59ef96cb41ec7328b3a9ee49124e997"

      def install
        mv "ockam.aarch64-apple-darwin", "ockam"
        bin.install "ockam"
        (bash_completion/"ockam").write `#{bin}/ockam completion --shell bash`
        (fish_completion/"ockam.fish").write `#{bin}/ockam completion --shell fish`
        (zsh_completion/"_ockam").write `#{bin}/ockam completion --shell zsh`
      end
    end

    if Hardware::CPU.intel?
      url "https://github.com/build-trust/ockam/releases/download/ockam_v0.82.0/ockam.x86_64-apple-darwin"
      sha256 "f5291e782e11048a72d681bf2dbce1a61530854218f8c3e937b54b6a5326f10e"

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
      url "https://github.com/build-trust/ockam/releases/download/ockam_v0.82.0/ockam.aarch64-unknown-linux-gnu"
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
      url "https://github.com/build-trust/ockam/releases/download/ockam_v0.82.0/ockam.x86_64-unknown-linux-gnu"
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
    assert_match "ockam_v0.82.0".sub!("_", " "), shell_output("#{bin}/ockam -V")
  end
end
