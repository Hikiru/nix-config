{
  gaming = {
    enable = true;
    vr.enable = true;
    streaming.enable = true;
  };

  services.lact.enable = true;

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  services.logind.settings.Login.HandlePowerKey = "poweroff";

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
