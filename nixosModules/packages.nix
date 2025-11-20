{
  pkgs,
  inputs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    # DE stuff/dots
    kdePackages.breeze
    adwaita-icon-theme
    gnome-software
    nautilus
    file-roller
    ffmpegthumbnailer
    unzip
    loupe
    celluloid
    chezmoi # chezmoi on NixOS? shameful!
    wallust

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
    onlyoffice-desktopeditors
    obs-studio
    obs-studio-plugins.obs-vaapi
    obs-studio-plugins.obs-vkcapture
    gpu-screen-recorder-gtk
    easyeffects
    video-trimmer
    upscayl
    localsend
    tailscale
    protonvpn-gui
    qbittorrent
    libsForQt5.qt5ct
    kdePackages.qt6ct
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
