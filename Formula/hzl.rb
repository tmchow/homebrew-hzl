require "language/node"

class Hzl < Formula
  desc "External task ledger for coding agents and OpenClaw"
  homepage "https://github.com/tmchow/hzl"
  url "https://registry.npmjs.org/hzl-cli/-/hzl-cli-1.13.2.tgz"
  sha256 "0dac716fd40fb38945706a6e0a6dfd5e1dd3b533fa4c66217648ccae0cee39a0"
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
