{ pkgs, lib, ... }:

pkgs.stdenv.mkDerivation {
  pname = "niri-tile-to-n";
  version = "2025-10-21";

  src = pkgs.fetchFromGitHub {
    owner = "heyoeyo";
    repo = "niri_tweaks";
    rev = "d51a5720a97ea123577167d368e1c3bf575ddd03";
    sha256 = lib.fakeHash;
  };

  nativeBuildInputs = [ pkgs.makeWrapper ];
  buildInputs = [ pkgs.python3 ];

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    cp $src/niri_tile_to_n.py $out/bin/niri-tile-to-n
    chmod +x $out/bin/niri-tile-to-n

    # Ensure the script uses the correct Python interpreter
    substituteInPlace $out/bin/niri-tile-to-n \
      --replace "#!/usr/bin/env python3" "#!${pkgs.python3}/bin/python3"

    runHook postInstall
  '';

  meta = with lib; {
    description = "Auto-tiler script for niri window manager";
    homepage = "https://github.com/heyoeyo/niri_tweaks";
    license = licenses.mit;
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
