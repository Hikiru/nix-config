{
  pkgs,
  ...
}:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    gamescopeSession.enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  services.logind.settings.Login.HandlePowerKey = "poweroff";

  environment.systemPackages = with pkgs; [
    heroic
    mangohud
  ];

  fileSystems = {
    "/".options = [ "compress=zstd" ];
    "/home".options = [ "compress=zstd" ];
    "/nix".options = [
      "compress=zstd"
      "noatime"
    ];
    "/run/media/hikiru/ssd".options = [ "compress=zstd" ];
  };

  networking.hostName = "anura";

  system.stateVersion = "25.05";
}
