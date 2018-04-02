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
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "xapian"

  def install
    mkdir "build" do
      system "cmake", "..", "-DCCACHE_FOUND=CCACHE_FOUND-NOTFOUND", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    system bin/"xapiand", "--version"
  end
end
