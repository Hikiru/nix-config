{ pkgs, ... }:

{
  # virtualisation.docker = {
  #   enable = true;
  #   rootless = {
  #     enable = true;
  #     setSocketVariable = true;
  #   };
  # };
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  users.users.hikiru.extraGroups = [ "docker" ];

  environment.systemPackages = [
    pkgs.docker-compose
    pkgs.freerdp # for winapps/winboat, just lumping it in with docker
  ];
}
