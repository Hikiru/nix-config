{
  inputs,
  ...
}:

{
  imports = [
    inputs.niri.homeModules.niri
    inputs.niri.homeModules.stylix
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
    inputs.dankMaterialShell.homeModules.dankMaterialShell.niri
  ];

  stylix.targets.niri.enable = false;
  programs = {
    niri = {
      enable = false;
      # settings = {
      #   input.touchpad = {
      #     tap = false;
      #     scroll-factor = 0.5;
      #   };
      #
      #   window-rules = [
      #     {
      #       geometry-corner-radius =
      #         let
      #           r = 8.0;
      #         in
      #         {
      #           top-left = r;
      #           top-right = r;
      #           bottom-left = r;
      #           bottom-right = r;
      #         };
      #       clip-to-geometry = true;
      #     }
      #   ];
      #
      #   binds = with config.lib.niri.actions; {
      #     "Mod+Shift+Slash".action = show-hotkey-overlay;
      #     "Mod+Q" = {
      #       hotkey-overlay.title = "Open Terminal";
      #       action.spawn = "kitty";
      #     };
      #     "Mod+C" = {
      #       hotkey-overlay.title = "Close window";
      #       action = close-window;
      #     };
      #     "Mod+O".action = toggle-overview;
      #     "Mod+1".action.focus-workspace = 1;
      #     "Mod+2".action.focus-workspace = 2;
      #     "Mod+3".action.focus-workspace = 3;
      #     "Mod+4".action.focus-workspace = 4;
      #     "Mod+5".action.focus-workspace = 5;
      #     "Mod+6".action.focus-workspace = 6;
      #     "Mod+7".action.focus-workspace = 7;
      #     "Mod+8".action.focus-workspace = 8;
      #     "Mod+9".action.focus-workspace = 9;
      #     "Mod+Shift+1".action.move-window-to-workspace = 1;
      #     "Mod+Shift+2".action.move-window-to-workspace = 2;
      #     "Mod+Shift+3".action.move-window-to-workspace = 3;
      #     "Mod+Shift+4".action.move-window-to-workspace = 4;
      #     "Mod+Shift+5".action.move-window-to-workspace = 5;
      #     "Mod+Shift+6".action.move-window-to-workspace = 6;
      #     "Mod+Shift+7".action.move-window-to-workspace = 7;
      #     "Mod+Shift+8".action.move-window-to-workspace = 8;
      #     "Mod+Shift+9".action.move-window-to-workspace = 9;
      #   };
      # };
    };

    dankMaterialShell = {
      enable = true;
      # niri.enableKeybinds = true;
      # niri.enableSpawn = true;
    };
  };
}
