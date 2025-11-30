{
  pkgs,
  inputs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    # DE stuff
    gnome-software
    nautilus
    file-roller
    xdg-user-dirs
    xdg-user-dirs-gtk
    ffmpegthumbnailer
    unzip
    loupe
    celluloid
    chezmoi # chezmoi on NixOS? shameful!
    wallust

    # Theming
    libsForQt5.qt5ct
    kdePackages.qt6ct
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.qtstyleplugin-kvantum
    kdePackages.breeze
    kdePackages.breeze.qt5
    adw-gtk3
    papirus-icon-theme
    adwaita-icon-theme
    (pkgs.callPackage .././derivations/palettum.nix { })

    # Terminal
    kitty
    starship
    yazi
    btop
    fastfetch

    # GUI
    inputs.zen-browser.packages."${stdenv.hostPlatform.system}".default
    (discord.override { withVencord = true; })
    vesktop
    youtube-music

    # Creative
    gimp
    krita
    pixieditor

    # Utilities
    inputs.winapps.packages."${stdenv.hostPlatform.system}".winapps
    inputs.winapps.packages."${stdenv.hostPlatform.system}".winapps-launcher
    onlyoffice-desktopeditors
    obs-studio
    obs-studio-plugins.obs-vaapi
    obs-studio-plugins.obs-vkcapture
    gpu-screen-recorder-gtk
    easyeffects
    video-trimmer
    upscayl
    protonvpn-gui
    qbittorrent
    gearlever

    # Dev
    zed-editor
    neovim
    git
    lazygit
    wget
    nixd
    nixfmt-rfc-style
    gcc
    python3
    gnumake
    just
  ];
}
