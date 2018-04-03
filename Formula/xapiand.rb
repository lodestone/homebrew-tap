class Xapiand < Formula
  desc "Xapiand: A RESTful Search Engine"
  homepage "https://kronuz.io/Xapiand"
  url "https://github.com/Kronuz/Xapiand/archive/v0.5.2.tar.gz"
  sha256 "2b44f681da563537649620db1dd183f9ad1292a649302bd0a93c8108bf54524a"
  head "https://github.com/Kronuz/Xapiand.git"

  bottle do
    root_url "https://kronuz.io/homebrew-tap"
    sha256 "cc9a169916464bc0c1fb255eb89d7cd8bfc4a088016ff301f9eb06ef70ae340c" => :high_sierra
    sha256 "f88fddf92416e0bc3a9b0de2f11d9fd4c0e509a4b271a923730ab969350eddeb" => :sierra
    sha256 "5d697d5f1fa73cff6041b0d759430904c2063101dafaaaf62240b917d37ae97a" => :el_capitan
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "llvm@5" => :build
  depends_on "xapian"

  def install
    mkdir "build" do
      args = std_cmake_args + %W[
        -DCMAKE_C_COMPILER=#{Formula["llvm@5"].opt_bin}/clang
        -DCMAKE_CXX_COMPILER=#{Formula["llvm@5"].opt_bin}/clang++
      ]
      system "cmake", "..", "-DCCACHE_FOUND=CCACHE_FOUND-NOTFOUND", *args
      system "make"
      system "install_name_tool", "-change", "#{Formula["llvm@5"].opt_lib}/libc++.1.dylib", "/usr/lib/libc++.1.dylib", "bin/xapiand"
      system "make", "install"
    end
  end

  test do
    system bin/"xapiand", "--version"
  end
end
