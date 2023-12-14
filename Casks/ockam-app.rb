cask "ockam-app" do
  version "ockam_v0.110.0"
  name "Ockam"
  desc "End-to-end encryption and mutual authentication for distributed applications"
  homepage "https://github.com/build-trust/ockam"

  if Hardware::CPU.arm?
    url "https://github.com/build-trust/ockam/releases/download/ockam_v0.110.0/ockam.app.aarch64-apple-darwin.dmg"
    sha256 "7510ae867cfffffd35a4c7c8e5be6fd42d260b4048f043cf36886ff961d1908c"
   end

  if Hardware::CPU.intel?
    url "https://github.com/build-trust/ockam/releases/download/ockam_v0.110.0/ockam.app.x86_64-apple-darwin.dmg"
    sha256 "254c169467cdb44f02d872867f745aa01b6b3d2e299fc688344865a5ea047eee"
  end

  depends_on formula: "ockam"
  app "Ockam.app"
  uninstall quit: "io.ockam.app"
end
