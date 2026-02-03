require "language/node"

class Hzl < Formula
  desc "External task ledger for coding agents and OpenClaw"
  homepage "https://github.com/tmchow/hzl"
  url "https://registry.npmjs.org/hzl-cli/-/hzl-cli-1.19.0.tgz"
  sha256 "a67a4686349da255f78da6db7192e8fd0329dd2562cc9bbcb113b1e8b156afbe"
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
