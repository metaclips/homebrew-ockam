cask "ockam-app" do
  version "ockam_v0.104.0"
  name "Ockam"
  desc "End-to-end encryption and mutual authentication for distributed applications"
  homepage "https://github.com/build-trust/ockam"

  if Hardware::CPU.arm?
    url "https://github.com/build-trust/ockam/releases/download/ockam_v0.104.0/ockam.app.aarch64-apple-darwin.dmg"
    sha256 "3df937628724e93bd4c926b1acd5d28f4c7cd5ddf0a6f8178de9c916d3237549"
   end

  if Hardware::CPU.intel?
    url "https://github.com/build-trust/ockam/releases/download/ockam_v0.104.0/ockam.app.x86_64-apple-darwin.dmg"
    sha256 "b396cbe345f207cda6ff5d61cd05d5a01fa0f4db28958c545e43e423f268cd9a"
  end

  depends_on formula: "ockam"
  app "Ockam.app"
  uninstall quit: "io.ockam.app"
end
