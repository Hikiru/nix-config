{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.zen-browser.homeModules.beta
    inputs.stylix.homeModules.stylix
    ./niri.nix
  ];

  home.username = "hikiru";
  home.homeDirectory = "/home/hikiru";

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    (discord.override { withVencord = true; })
    vesktop
    youtube-music
    nixd
    nil
    nixfmt-rfc-style
    gcc
    unzip
    nodejs
    python3
    lazygit
    chezmoi # chezmoi in home manager config? shameful!
    pywal16
  ];

  programs = {
    zen-browser = {
      enable = true;
      profiles.hikiru = { };
    };

    brave.enable = true;
    onlyoffice.enable = true;

    zed-editor = {
      enable = true;
      userSettings = {
        vim_mode = true;
      };
    };

    kitty = {
      enable = true;
      shellIntegration.mode = "enabled";
    };

    helix = {
      enable = true;
      package = pkgs.evil-helix;
      settings = {
        editor = {
          line-number = "relative";
          file-picker.hidden = false;
          cursor-shape = {
            insert = "bar";
            normal = "block";
            select = "underline";
          };
        };
      };
      languages = {
        language = [
          {
            name = "nix";
            formatter.command = "nixfmt";
          }
        ];
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

  stylix = {
    enable = false;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
    fonts.monospace = {
      package = pkgs.nerd-fonts.caskaydia-cove;
      name = "CaskaydiaCove Nerd Font";
    };
    targets.zen-browser.profileNames = [ "hikiru" ];
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
}
