{ fetchurl, lib, stdenv, emacs, curl, check, bc }:

stdenv.mkDerivation rec {
  pname = "recutils";
  version = "1.8";

  src = fetchurl {
    url = "mirror://gnu/recutils/recutils-${version}.tar.gz";
    sha256 = "14xiln4immfsw8isnvwvq0h23f6z0wilpgsc4qzabnrzb5lsx3nz";
  };

  hardeningDisable = [ "format" ];

  buildInputs = [ curl emacs ];

  checkInputs = [ check bc ];
  doCheck = true;

  meta = {
    description = "Tools and libraries to access human-editable, text-based databases";

    longDescription =
      '' GNU Recutils is a set of tools and libraries to access
         human-editable, text-based databases called recfiles.  The data is
         stored as a sequence of records, each record containing an arbitrary
         number of named fields.
      '';

    homepage = "https://www.gnu.org/software/recutils/";

    license = lib.licenses.gpl3Plus;

    platforms = lib.platforms.all;
    maintainers = [ ];
  };
}
