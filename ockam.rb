// Note This file if touched must be updated in ./github/ockam.rb.template
// for release automation to work

class Ockam < Formula
  desc "End-to-end encryption and mutual authentication for distributed applications"
  homepage "https://github.com/build-trust/ockam"
  license "Apache-2.0"

  @@target = nil

  if OS.mac?
    if Hardware::CPU.arm?
      @@target = "aarch64-apple-darwin"
      sha256 "0afd2c87274cf07e3afb55b71c3d742dabce7fec95d042167bf8cc2d89902da3"
    end

    if Hardware::CPU.intel?
      @@target = "x86_64-apple-darwin"
      sha256 "20a06d42fd1dabf8af0f791dd37adb03c8bc6076c3df0722ea05bb9ec834ca3f"
    end
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      @@target = "aarch64-unknown-linux-gnu"
      sha256 "e1b893d1750e26abceee25c22558570fb08f4aaa15f332fab5dbf083819085e0"
    end

    if Hardware::CPU.intel?
      @@target = "x86_64-unknown-linux-gnu"
      sha256 "5d2bde898722f862842ee06588f9a7ca7175a4f21557f2e98aef8830aa6f31b1"
    end
  end

  url "#{homepage}/releases/download/ockam_v0.59.0/ockam.#{@@target}"

  def install
    if !@@target.nil?
      mv "ockam.#{@@target}", "ockam"
      bin.install "ockam"
    end
  end

  test do
    system "ockam", "--version"
  end
end
