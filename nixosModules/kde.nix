{ pkgs, ... }:

{
  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = with pkgs; [
    plasma-browser-integration
    konsole
    (lib.getBin qttools)
    ark
    elisa
    gwenview
    okular
    kate
    khelpcenter
    dolphin
    baloo-widgets
    dolphin-plugins
    spectacle
    ffmpegthumbs
    krdp
    xwaylandvideobridge
  ];
}
