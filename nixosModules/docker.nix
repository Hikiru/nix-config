{ pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  users.users.hikiru.extraGroups = [ "docker" ];

  environment.systemPackages = [
    pkgs.docker-compose
    pkgs.freerdp # for winapps/winboat, just lumping it in with docker
  ];
}
