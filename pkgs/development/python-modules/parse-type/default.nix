{ lib, fetchPypi
, buildPythonPackage, pythonOlder
, pytest, pytest-runner
, parse, six, enum34
}:

buildPythonPackage rec {
  pname = "parse_type";
  version = "0.5.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "02wclgiqky06y36b3q07b7ngpks5j0gmgl6n71ac2j2hscc0nsbz";
  };

  checkInputs = [ pytest pytest-runner ];
  propagatedBuildInputs = [ parse six ] ++ lib.optional (pythonOlder "3.4") enum34;

  checkPhase = ''
    py.test tests
  '';

  meta = with lib; {
    homepage = "https://github.com/jenisys/parse_type";
    description = "Simplifies to build parse types based on the parse module";
    license = licenses.bsd3;
    maintainers = with maintainers; [ alunduil ];
  };
}
