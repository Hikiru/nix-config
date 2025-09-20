{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "hikiru";
  home.homeDirectory = "/home/hikiru";

  home.packages = with pkgs; [
    zed
    vim
  ];

  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
