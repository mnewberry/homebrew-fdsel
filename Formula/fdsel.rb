class Fdsel < Formula
  desc "CLI fdsel is an utiliy for inferring frequency-dependent selection"
  homepage "https://github.com/mnewberry/fdsel"
  url "https://github.com/fercp/fdsel", using: :git, branch: "main"
  version "1.0"
  license "GPL-3.0-or-later"

  depends_on "ocaml" => :build
  depends_on "opam" => :build
  depends_on "pkg-config"

  def install
    system "opam", "-y", "init"
    system "opam", "-y", "install", "dune"
    system "opam", "-y", "install", "batteries"
    system "opam", "-y", "install", "pcre"
    system "opam", "-y", "install", "gsl"
    system "eval", "$(opam config env)"
    system "dune", "build", "fdsel.exe"
    mv "_build/default/fdsel.exe", "./fdsel.native"
  end

  test do
    system "false"
  end
end
