{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.zen-browser.homeModules.beta
    ./dms.nix
  ];

  home.username = "hikiru";
  home.homeDirectory = "/home/hikiru";

  home.packages = with pkgs; [
    gnome-software
    nautilus
    loupe
    (discord.override { withVencord = true; })
    vesktop
    youtube-music
    obs-studio
    kitty
    starship
    nixd
    nil
    nixfmt-rfc-style
    gcc
    unzip
    nodejs
    python3
    lazygit
    chezmoi # chezmoi in home manager config? shameful!
    wallust
  ];

  programs = {
    zen-browser = {
      enable = true;
      profiles.default = { };
    };

    brave.enable = true;
    onlyoffice.enable = true;

    zed-editor = {
      enable = true;
      userSettings = {
        vim_mode = true;
      };
    };

    yazi.enable = true;

    btop = {
      enable = true;
      settings = {
        "theme_color" = "TTY";
        "vim_keys" = true;
      };
    };
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
    colorScheme = "dark";
    gtk3.theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };
    font = {
      name = "DejaVu Sans";
      package = pkgs.dejavu_fonts;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "Breeze";
  };

  home.file = {
    ".local/share/icons/default" = {
      source = "${pkgs.adwaita-icon-theme}/share/icons/Adwaita/";
      recursive = true;
    };
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/hikiru/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "hx";
  };

  programs.home-manager.enable = true;

  home.stateVersion = "25.05";
}
