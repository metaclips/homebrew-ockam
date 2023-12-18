cask "ockam-app" do
  version "ockam_v0.113.0"
  name "Ockam"
  desc "End-to-end encryption and mutual authentication for distributed applications"
  homepage "https://github.com/build-trust/ockam"

  if Hardware::CPU.arm?
    url "https://github.com/build-trust/ockam/releases/download/ockam_v0.113.0/ockam.app.aarch64-apple-darwin.dmg"
    sha256 "584ab1322a8fe7d0b6f9f7c83dd7b1d808fe916a9b9b4d937cc8bf4b9d5efdf2"
   end

  if Hardware::CPU.intel?
    url "https://github.com/build-trust/ockam/releases/download/ockam_v0.113.0/ockam.app.x86_64-apple-darwin.dmg"
    sha256 "ae807b492d3c282243e87cbb6540021a157054853a367bc671956c00502261c2"
  end

  depends_on formula: "ockam"
  app "Ockam.app"
  uninstall quit: "io.ockam.app"
end
