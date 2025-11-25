{
  lib,
  stdenv,
  fetchurl,
}:

stdenv.mkDerivation rec {
  pname = "palettum";
  version = "0.6.1";

  src = fetchurl {
    url = "https://github.com/arrowpc/palettum/releases/download/v${version}/palettum-x86_64-unknown-linux-gnu.tar.gz";
    hash = "sha256-tJXAuXIx6Ixd0AZV/DZiMv4sKQ+y5tP0wXwXmCd8Fhw=";
  };

  dontBuild = true;

  unpackPhase = ''
    runHook preUnpack
    mkdir -p $TMP/palettum
    cd $TMP/palettum
    tar -z -xf $src
    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin/
    cp palettum $out/bin/
    runHook postInstall
  '';

  meta = with lib; {
    description = "Web app and CLI tool that lets you recolor images, GIFs, and videos with any custom palette of your choosing.";
    mainProgram = "palettum";
    homepage = "https://github.com/arrowpc/palettum";
    license = licenses.agpl3Only;
    maintainers = with maintainers; [ Hikiru ];
  };
}
