require "language/node"

class Hzl < Formula
  desc "External task ledger for coding agents and OpenClaw"
  homepage "https://github.com/tmchow/hzl"
  url "https://registry.npmjs.org/hzl-cli/-/hzl-cli-1.28.3.tgz"
  sha256 "f334363cb893f9ad737b09093f45a14f34f812b85279ab6e6a0e76f508c3ebb6"
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
