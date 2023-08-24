{ config, pkgs, lib, inputs, ...}:
{
  environment.systemPackages = with pkgs; [
    
    signal-desktop 
    kitty
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
    protonup-qt
    lutris     
    mangohud
    gimp
    git
    spotify
  ];
fonts.packages= with pkgs; [
  #fonts
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
  

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  services.flatpak.enable = true;
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
 
  nix = {
 
    package = pkgs.nixUnstable;
    extraOptions =
      let empty_registry = builtins.toFile "empty-flake-registry.json" ''{"flakes":[],"version":2}''; in
      ''
        experimental-features = nix-command flakes
        flake-registry = ${empty_registry}
        builders-use-substitutes = true
      '';
    settings.trusted-users = [ "@wheel" "root" ];
    registry.nixpkgs.flake = inputs.nixpkgs;
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
  };
}
