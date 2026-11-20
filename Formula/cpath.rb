class Cpath < Formula
  desc "Zero-dependency CLI to copy absolute paths across local shells and SSH (OSC 52)"
  homepage "https://github.com/Arcadiastra/cpath"
  url "https://github.com/Arcadiastra/cpath/releases/download/v0.1.0/cpath-0.1.0.tar.gz"
  sha256 "fc21d5906d40fcd7900c6fb0c702a953b92de4540e5f16ae0586318ea1d54c0d"
  license "MIT"

  def install
    bin.install "bin/cpath"
    bash_completion.install "completions/cpath.bash" => "cpath"
    zsh_completion.install "completions/_cpath"
    man1.install "man/cpath.1"
  end

  test do
    (testpath/"hello.txt").write("hi\n")
    assert_equal (testpath.realpath/"hello.txt").to_s,
                 shell_output("#{bin}/cpath -p #{testpath}/hello.txt").strip
    assert_match version.to_s, shell_output("#{bin}/cpath --version")
  end
end
