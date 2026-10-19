{ pkgs, ... }:

{
  programs.noctalia.enable = true;

  programs.dms-shell = {
    enable = true;
    systemd.enable = false;
    excludePackages = [ pkgs.matugen ];
  };

  services.displayManager.dms-greeter = {
    enable = true;
    compositor.name = "niri";
  };
}
