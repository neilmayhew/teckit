{ stdenv, fetchFromGitHub,
  autoreconfHook, intltool, libtool, pkgconfig, expat, zlib }:

stdenv.mkDerivation rec {

  version = "2.5.10";
  name = "teckit-${version}";

  src = fetchFromGitHub {
    owner = "silnrsi";
    repo = "teckit";
    rev = "v${version}";
    sha256 = "1bsxk2sw60yvwjng99i1vnizlglw7zf2cwpwyxhxbg3aai4cl98f";
  };

  buildInputs = [
    autoreconfHook intltool libtool pkgconfig expat zlib
  ];

  doCheck = true;

  preCheck = ''
    patchShebangs test
  '';

  meta = with stdenv.lib; {
    homepage = https://scripts.sil.org/teckit;
    description = "A library for text encoding conversion";
    license = licenses.gpl2;
    maintainers = [ "Neil Mayhew <neil_mayhew@sil.org>" ];
    platforms = platforms.linux ++ platforms.darwin;
  };
}
