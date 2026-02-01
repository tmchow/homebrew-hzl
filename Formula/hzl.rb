require "language/node"

class Hzl < Formula
  desc "External task ledger for coding agents and OpenClaw"
  homepage "https://github.com/tmchow/hzl"
  url "https://registry.npmjs.org/hzl-cli/-/hzl-cli-1.9.2.tgz"
  sha256 "89a486c1f221cc52f115c3fae6178ac3cc8576e53e367bfddb36c1f9ba8e3682"
  license "MIT"

  depends_on "node"

  def install
    # Call npm install to install the dependencies including the devDependencies that might be needed for postinstall
    # We use std_npm_install_args to pointing to the libexec directory
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    
    # Symlink the binary from libexec/bin to the Cellar's bin
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/hzl", "--version"
  end
end
