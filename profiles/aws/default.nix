{ inputs, outputs, lib, config, pkgs, ... }:
{
  imports = [
  ./colors.nix
  ./nixconfigs
  ./configs

  inputs.nix-colors.homeManagerModules.default

  ];

  home.packages = with pkgs; [
    
    ttf-icomoon-feather
    android-tools  xorg.xhost  python311  python311Packages.pipx
    neovim  ventoy-full
    lzip  fzf  gh  git  playerctl  zsh  tldr  autojump  thefuck
    
    vulkan-tools  wine  protonup-qt  lutris  mangohud  gamemode  gamescope
    
    ffmpeg  vlc  mpv  syncplay
    
    (wrapOBS { plugins = with obs-studio-plugins; [ obs-backgroundremoval obs-vaapi wlrobs obs-gstreamer obs-vkcapture ]; })
    telegram-desktop  discord-canary  signal-desktop 
    spotify  microsoft-edge  gimp
    
    
    #sound :
    pavucontrol  qjackctl  wireplumber  helvum
    
    #hypr assets : 
    way-displays  polkit_gnome  cliphist wl-clipboard wtype libsForQt5.dolphin  inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
    waybar  gnome.gnome-software bemenu  wpa_supplicant    wlr-randr  libsForQt5.qt5.qtwayland  mako  swww  connman-gtk  blueberry gparted   
    #wofi
     
    
    flatpak  flatpak-builder
    
    #fonts
    jetbrains-mono  font-awesome  font-awesome_5  font-awesome_4  nerdfonts  terminus-nerdfont  inconsolata-nerdfont  nerdfix  fira-code  fira-code-symbols
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
