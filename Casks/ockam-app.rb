cask "ockam-app" do
  version "ockam_v0.99.0"
  name "Ockam"
  desc "End-to-end encryption and mutual authentication for distributed applications"
  homepage "https://github.com/build-trust/ockam"

  if Hardware::CPU.arm?
    url "https://github.com/build-trust/ockam/releases/download/ockam_v0.99.0/ockam.app.aarch64-apple-darwin.dmg"
    sha256 "ab1b4bf3c21120e16d676acbc77de405a2b5c53f1f34ef83153397ea3b1edce5"
   end

  if Hardware::CPU.intel?
    url "https://github.com/build-trust/ockam/releases/download/ockam_v0.99.0/ockam.app.x86_64-apple-darwin.dmg"
    sha256 "3ea7b8c560ba231e2894cf2c449239069058fd1137bf9d3db503dae36b157fd3"
  end

  depends_on formula: "ockam"
  app "Ockam.app"
  uninstall quit: "io.ockam.app"
end
