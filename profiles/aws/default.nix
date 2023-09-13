{ inputs, outputs, lib, config, pkgs, ... }:
{
  imports = [
  ./colors.nix
  ./nixconfigs
  ./configs

  inputs.nix-colors.homeManagerModules.default

  ];

  home.packages = with pkgs; [
  playerctl
    android-tools
    zsh
    xorg.xhost
    signal-desktop 
    gamemode
    gamescope
    tldr
    autojump  
    thefuck
    ffmpeg
    vlc
    mpv
    syncplay
    telegram-desktop
    microsoft-edge
    wine
    protonup-qt
    lutris     
    mangohud
    gimp
    git
    spotify
    libsForQt5.dolphin
    gnome.file-roller
    discord-canary
    way-displays
    ventoy-full
    vulkan-tools
    polkit_gnome
    gparted
    python311
    python311Packages.pipx
    lzip
    neovim
    git
    waybar
    #sound :
    pavucontrol
    qjackctl
    wireplumber
    helvum
    #hypr assets : 
    mako
    (wrapOBS {
      plugins = with obs-studio-plugins; [
        obs-backgroundremoval
	obs-vaapi
        wlrobs
	obs-gstreamer
        obs-vkcapture
      ];
     })
    bemenu
    gh
    connman-gtk
    blueberry
    wpa_supplicant
    swww
    flatpak
    flatpak-builder
    gnome.gnome-software
    cliphist
    libsForQt5.qt5.qtwayland
    fzf
    playerctl
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast 
    wtype
    wl-clipboard
    lxappearance
    wlr-randr
  #fonts
  jetbrains-mono
  font-awesome
  font-awesome_5
  font-awesome_4
  nerdfonts
  terminus-nerdfont
  inconsolata-nerdfont
  nerdfix
  fira-code
  fira-code-symbols
  ];
  
  wayland.windowManager.hyprland.enable = true; 

  nixpkgs.config.allowUnfree = true;
    
  programs.git.enable = true;
  programs.home-manager.enable = true;
  home.username = "aws";
  home.homeDirectory = "/home/aws";
  systemd.user.startServices = "sd-switch";
  home.stateVersion = "23.05";
}
