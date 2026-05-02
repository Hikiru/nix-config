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
    rmpc
    mpd

    # GUI
    inputs.zen-browser.packages."${stdenv.hostPlatform.system}".default
    (discord.override { withVencord = true; })
    vesktop
    stoat-desktop
    pear-desktop
    spotify

    # Creative
    gimp
    krita
    pixieditor
    aseprite
    reaper
    obsidian

    # Utilities
    inputs.winapps.packages."${stdenv.hostPlatform.system}".winapps
    inputs.winapps.packages."${stdenv.hostPlatform.system}".winapps-launcher
    distrobox
    distroshelf
    onlyoffice-desktopeditors
    obs-studio
    obs-studio-plugins.obs-vaapi
    obs-studio-plugins.obs-vkcapture
    obs-studio-plugins.obs-pipewire-audio-capture
    gpu-screen-recorder-gtk
    mjpg-streamer
    vlc
    easyeffects
    video-trimmer
    upscayl
    ffmpeg
    protonvpn-gui
    qbittorrent
    gearlever
    rpi-imager

    # Dev
    zed-editor
    neovim
    godotPackages_4_3.godot
    godot
    git
    lazygit
    wget
    nixd
    nixfmt
    gcc
    python3
    gnumake
    just

    # Misc
    icu
    webkitgtk_4_1
    android-tools
  ];
}
