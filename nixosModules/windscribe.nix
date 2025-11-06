{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.services.windscribe;
in
{
  options.services.windscribe = {
    enable = mkEnableOption "Windscribe VPN client";

    package = mkOption {
      type = types.package;
      default = pkgs.callPackage ../derivations/windscribe.nix { };
      defaultText = literalExpression "pkgs.callPackage ../derivations/windscribe.nix {}";
      description = "The Windscribe package to use";
    };
  };

  config = mkIf cfg.enable {
    # Create the windscribe group
    users.groups.windscribe = { };

    # Install the package
    environment.systemPackages = [ cfg.package ];

    # Enable the windscribe-helper systemd service
    systemd.services.windscribe-helper = {
      description = "Windscribe VPN Helper";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];

      serviceConfig = {
        Type = "simple";
        ExecStart = "${cfg.package}/opt/windscribe/windscribe-helper";
        Restart = "always";
        RestartSec = 3;

        # Security settings
        NoNewPrivileges = false;
        PrivateTmp = true;
        ProtectSystem = "full";
        ProtectHome = true;

        # Capabilities needed for VPN functionality
        AmbientCapabilities = [
          "CAP_NET_ADMIN"
          "CAP_NET_RAW"
        ];
        CapabilityBoundingSet = [
          "CAP_NET_ADMIN"
          "CAP_NET_RAW"
        ];
      };
    };

    # Set up required system permissions
    security.wrappers.windscribe-helper = {
      owner = "root";
      group = "windscribe";
      capabilities = "cap_net_admin,cap_net_raw+eip";
      source = "${cfg.package}/opt/windscribe/windscribe-helper";
    };
  };
}
