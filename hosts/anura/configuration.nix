{
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  fileSystems = {
    "/".options = [ "compress=zstd" ];
    "/home".options = [ "compress=zstd" ];
    "/nix".options = [ "compress=zstd" "noatime" ];
  };

  networking.hostName = "anura";

  system.stateVersion = "25.05";
}
