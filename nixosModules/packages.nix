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
    gsettings-desktop-schemas

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
    # stoat-desktop
    pear-desktop
    spotify
    stremio-linux-shell

    # Creative
    gimp
    krita
    pixieditor
    aseprite
    reaper
    obsidian

    # Utilities
    distrobox
    distroshelf
    onlyoffice-desktopeditors
    proton-vpn
    qbittorrent
    gearlever
    popsicle

    # Audio/video
    gpu-screen-recorder-ui
    vlc
    easyeffects
    constrict
    video-trimmer
    upscayl
    ffmpeg
    v4l-utils
    pulseaudio

    # Dev
    zed-editor
    neovim
    godotPackages_4_3.godot
    godot
    git
    gh
    lazygit
    wget
    nixd
    nixfmt
    gcc
    python3
    gnumake
    just
    glib

    # Misc
    icu
    webkitgtk_4_1
    android-tools
    libGL
  ];
}
