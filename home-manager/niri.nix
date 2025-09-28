{ inputs, ... }:

{
  imports = [
    inputs.niri.homeModules.niri
    inputs.dankMaterialShell.homeModules.dankMaterialShell
  ];

  programs = {
    niri.settings = {
      window-rules = {
        geometry-corner-radius = 10;
        clip-to-geometry = true;
      };
      binds = {
        "Mod+1".action.focus-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        "Mod+3".action.focus-workspace = 3;
        "Mod+4".action.focus-workspace = 4;
        "Mod+5".action.focus-workspace = 5;
        "Mod+6".action.focus-workspace = 6;
        "Mod+7".action.focus-workspace = 7;
        "Mod+8".action.focus-workspace = 8;
        "Mod+9".action.focus-workspace = 9;
      };
    };

    dankMaterialShell = {
      enable = true;
      enableKeybinds = true;
      enableSpawn = true;
    };
  };
}
