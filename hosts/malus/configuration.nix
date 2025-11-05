{
  pkgs,
  ...
}:

{
  services.tlp.enable = true;
  services.power-profiles-daemon.enable = false;

  networking.hostName = "malus";

  system.stateVersion = "25.05";
}
