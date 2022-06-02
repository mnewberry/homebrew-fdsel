class Fdsel < Formula
  desc "CLI fdsel is an utiliy for inferring frequency-dependent selection"
  homepage "https://github.com/mnewberry/fdsel"
  url "https://github.com/mnewberry/fdsel", using: :git, branch: "main"
  version "1.0"
  license "GPL-3.0-or-later"

  depends_on "ocaml" => :build
  depends_on "opam" => :build
  depends_on "gsl" => :build
  depends_on "pcre" => :build

  def install
    system "opam", "-y", "init"
    system "opam", "-y", "install", "dune"
    system "opam", "-y", "install", "batteries"
    system "opam", "-y", "install", "pcre"
    system "opam", "-y", "install", "gsl"
    system "eval $(opam env); dune build fdsel.exe"
    system "mkdir","#{bin}"
    system "cp","_build/default/fdsel.exe", "#{bin}/fdsel"
  end

  test do
    system "true"
  end
end
