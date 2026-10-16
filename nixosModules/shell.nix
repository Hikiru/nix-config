{ pkgs, ... }:

{
  programs.noctalia.enable = true;

  programs.dms-shell = {
    enable = true;

    enableSystemMonitoring = true;
    enableVPN = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
  };

  services.displayManager.dms-greeter = {
    enable = true;
    compositor.name = "niri";
  };
}
