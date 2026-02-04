require "language/node"

class Hzl < Formula
  desc "External task ledger for coding agents and OpenClaw"
  homepage "https://github.com/tmchow/hzl"
  url "https://registry.npmjs.org/hzl-cli/-/hzl-cli-1.24.0.tgz"
  sha256 "4b2fecae2ee7d90cd861346aa9fdd9608504f6356b0eab388b86a118c0f81b22"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/hzl", "--version"
  end
end
