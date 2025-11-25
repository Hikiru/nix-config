{
  pkgs,
  lib,
  config,
  ...
}:

let
  cfg = config.gaming;
in
{
  options = {
    gaming = {
      enable = lib.mkEnableOption "Enables flatscreen gaming with Steam and Heroic.";

      vr.enable = lib.mkEnableOption "Enables VR with WiVRn and addons.";

      streaming = {
        enable = lib.mkEnableOption "Installs Sunshine and Moonlight.";

        sunshine = {
          enable = lib.mkOption {
            type = lib.types.bool;
            default = cfg.streaming.enable;
            description = "Installs Sunshine only.";
          };
          autoStart = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Autostart Sunshine.";
          };
        };

        moonlight = {
          enable = lib.mkOption {
            type = lib.types.bool;
            default = cfg.streaming.enable;
            description = "Installs Moonlight only.";
          };
        };
      };
    };
  };

  config = lib.mkIf cfg.enable {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };

    services.wivrn = lib.mkIf cfg.vr.enable {
      enable = true;
      openFirewall = true;
      highPriority = true;
      defaultRuntime = true;
      steam.importOXRRuntimes = true;
    };

    services.sunshine = lib.mkIf cfg.streaming.sunshine.enable {
      enable = true;
      openFirewall = true;
      autoStart = lib.mkIf cfg.streaming.sunshine.autoStart true;
    };

    environment.systemPackages =
      with pkgs;
      [
        heroic
        sgdboop
        mangohud
        gamescope
        (callPackage .././derivations/scopebuddy.nix { })
      ]
      ++ lib.optionals cfg.vr.enable [
        wlx-overlay-s
        wayvr-dashboard
      ]
      ++ lib.optional cfg.streaming.moonlight.enable moonlight-qt;
  };
}
