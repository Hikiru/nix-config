{
  lib,
  stdenv,
  fetchFromGitHub,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "scopebuddy";
  version = "1.2.6";

  src = fetchFromGitHub {
    owner = "HikariKnight";
    repo = "ScopeBuddy";
    tag = "${finalAttrs.version}";
    hash = "sha256-e3+/IKB9w50snYNa+85TZ0T2e4FmRmnmJK3NwGGunbc=";
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin/
    cp -r bin/* $out/bin/
    runHook postInstall
  '';

  meta = with lib; {
    description = "A manager script to make gamescope easier to use on the desktop.";
    mainProgram = "scopebuddy";
    homepage = "https://github.com/HikariKnight/ScopeBuddy";
    license = licenses.asl20;
    maintainers = with maintainers; [ Hikiru ];
  };
})
