{ inputs, ... }:

{
  imports = [
    inputs.dankMaterialShell.nixosModules.dankMaterialShell
    inputs.dankMaterialShell.nixosModules.greeter
  ];

  programs.dankMaterialShell = {
    enable = true;
    greeter = {
      enable = true;
      compositor.name = "niri";
      configHome = "/home/hikiru";
    };
  };
}
