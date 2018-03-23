class Xapiand < Formula
  desc "Xapiand: A RESTful Search Engine"
  homepage "https://kronuz.io/Xapiand"
  url "https://github.com/Kronuz/Xapiand/archive/v0.5.1.tar.gz"
  sha256 "9dd4cad66a36e755c7d93ac975571dd79e89185de03387c390c92c4cb14d0f05"
  head "https://github.com/Kronuz/Xapiand.git"

  bottle do
    root_url "https://kronuz.io/homebrew-tap"
    sha256 "381a31807b625166bcd80bab1362cdaab709ef977760908eb94caa3fd55c7bab" => :high_sierra
    sha256 "3118e22ce9ee663ac6857b1e30329951cc6fd2a5668ef932ef1ad4903ba6327f" => :sierra
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
