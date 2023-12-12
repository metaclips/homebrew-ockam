cask "ockam-app" do
  version "ockam_v0.109.0"
  name "Ockam"
  desc "End-to-end encryption and mutual authentication for distributed applications"
  homepage "https://github.com/build-trust/ockam"

  if Hardware::CPU.arm?
    url "https://github.com/build-trust/ockam/releases/download/ockam_v0.109.0/ockam.app.aarch64-apple-darwin.dmg"
    sha256 "aade188c81d373d1f978952e8a13355ba0cb1bdcb0c232946ed667bb70d07b5a"
   end

  if Hardware::CPU.intel?
    url "https://github.com/build-trust/ockam/releases/download/ockam_v0.109.0/ockam.app.x86_64-apple-darwin.dmg"
    sha256 "144247622f3d6ad0d91409db817d34d394b721c4a15d949a6c70684ba0a4b8a5"
  end

  depends_on formula: "ockam"
  app "Ockam.app"
  uninstall quit: "io.ockam.app"
end
