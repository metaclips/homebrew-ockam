cask "ockam-app" do
  version "ockam_v0.109.0"
  name "Ockam"
  desc "End-to-end encryption and mutual authentication for distributed applications"
  homepage "https://github.com/build-trust/ockam"

  if Hardware::CPU.arm?
    url "https://github.com/build-trust/ockam/releases/download/ockam_v0.109.0/ockam.app.aarch64-apple-darwin.dmg"
    sha256 "a5a9c3d87292f63e76927aea2e4d107c422d57decd15406d41e81c42bf5b7b59"
   end

  if Hardware::CPU.intel?
    url "https://github.com/build-trust/ockam/releases/download/ockam_v0.109.0/ockam.app.x86_64-apple-darwin.dmg"
    sha256 "f762beccf3f124076ab3ba68b0a9557f666ff5078e84cc198ca19cd821e0da13"
  end

  depends_on formula: "ockam"
  app "Ockam.app"
  uninstall quit: "io.ockam.app"
end
