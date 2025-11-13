{
  pkgs,
  inputs,
}:

{
  environment.systemPackages = with pkgs; [
    # DE stuff/dots
    adwaita-icon-theme
    gnome-software
    nautilus
    ffmpegthumbnailer
    unzip
    loupe
    chezmoi # chezmoi on NixOS? shameful!
    wallust

    # Terminal
    kitty
    starship
    yazi
    btop
    fastfetch

    # GUI
    inputs.zen-browser.packages."${system}".default
    (discord.override { withVencord = true; })
    vesktop
    youtube-music

    # Utilities
    onlyoffice-bin
    obs-studio
    obs-studio-plugins.obs-vaapi
    obs-studio-plugins.obs-vkcapture
    gpu-screen-recorder-gtk
    easyeffects
    video-trimmer
    libsForQt5.qt5ct
    kdePackages.qt6ct

    # Dev
    zed
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
