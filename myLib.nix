{ mkDerivation, base, directory, stdenv }:
mkDerivation {
  pname = "myLib";
  version = "0.0.0";
  src = ./.;
  libraryHaskellDepends = [ base ];
  testHaskellDepends = [ base directory ];
  license = stdenv.lib.licenses.bsd3;
}
