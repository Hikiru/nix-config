{ inputs, ... }:

{
  imports = [
    inputs.dankMaterialShell.nixosModules.dank-material-shell
    inputs.dankMaterialShell.nixosModules.greeter
  ];

  programs.dank-material-shell = {
    enable = true;
    greeter = {
      enable = true;
      compositor.name = "niri";
      configHome = "/home/hikiru";
    };
  };
}
