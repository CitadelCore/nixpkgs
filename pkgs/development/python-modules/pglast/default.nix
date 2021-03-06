{ lib
, buildPythonPackage
, fetchFromGitHub
, isPy3k
, setuptools
, pytest-cov
, pytest
}:

buildPythonPackage rec {
  pname = "pglast";
  version = "3.3";

  # PyPI tarball does not include all the required files
  src = fetchFromGitHub {
    owner = "lelit";
    repo = pname;
    rev = "v${version}";
    fetchSubmodules = true;
    sha256 = "0l7nvbs1x1qil6mc0rxk7925i5xr3nbqnv0vakx3yv911kj3yhgv";
  };

  disabled = !isPy3k;

  propagatedBuildInputs = [ setuptools ];

  checkInputs = [ pytest pytest-cov ];

  pythonImportsCheck = [ "pglast" ];

  checkPhase = ''
    pytest
  '';

  meta = with lib; {
    homepage = "https://github.com/lelit/pglast";
    description = "PostgreSQL Languages AST and statements prettifier";
    changelog = "https://github.com/lelit/pglast/raw/v${version}/CHANGES.rst";
    license = licenses.gpl3Plus;
    maintainers = [ maintainers.marsam ];
  };
}
