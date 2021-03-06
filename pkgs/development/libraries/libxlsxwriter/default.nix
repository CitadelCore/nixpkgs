{ lib
, stdenv
, fetchFromGitHub
, minizip
, python3
, zlib
}:

stdenv.mkDerivation rec {
  pname = "libxlsxwriter";
  version = "1.1.1";

  src = fetchFromGitHub {
    owner = "jmcnamara";
    repo = "libxlsxwriter";
    rev = "RELEASE_${version}";
    sha256 = "1bi8a1pj18836yfqsnmfp45nqhq2d9r2r7gzi2v1y0qyk9jh6xln";
  };

  nativeBuildInputs = [
    python3.pkgs.pytest
  ];

  buildInputs = [
    minizip
    zlib
  ];

  makeFlags = [
    "PREFIX=${placeholder "out"}"
    "USE_SYSTEM_MINIZIP=1"
  ];

  doCheck = true;

  checkTarget = "test";

  meta = with lib; {
    description = "C library for creating Excel XLSX files";
    homepage = "https://libxlsxwriter.github.io/";
    changelog = "https://github.com/jmcnamara/libxlsxwriter/blob/${src.rev}/Changes.txt";
    license = licenses.bsd2;
    maintainers = with maintainers; [ dotlambda ];
    platforms = platforms.unix;
  };
}
