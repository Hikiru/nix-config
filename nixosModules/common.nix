{
  pkgs,
  ...
}:

{
  # Storage optimization
  nix.optimise.automatic = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # FHS compat
  services.envfs.enable = true;
  programs.nix-ld.enable = true;

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  services.gvfs.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.networkmanager.enable = true;
  programs.nm-applet.enable = false;

  hardware.bluetooth.enable = true;

  time.timeZone = "America/Chicago";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
  };

  services.upower.enable = true;

  services.playerctld.enable = true;

  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
  ];

  xdg.icons.enable = true;

  services.flatpak.enable = true;
  programs.firefox.enable = true;
  programs.fish.enable = true;
  programs.localsend = {
    enable = true;
    openFirewall = true;
  };

  users.users.hikiru = {
    isNormalUser = true;
    description = "Hikiru";
    shell = pkgs.fish;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  nixpkgs.config.allowUnfree = true;

  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      nerd-fonts.caskaydia-cove
      dejavu_fonts
    ];
  };

  environment.variables.EDITOR = "nvim";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "25.05";
}
