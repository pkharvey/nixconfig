{ config, pkgs, lib, inputs, ...}:
{
  home-manager.users.pasha = { pkgs, ... }: {
    home.packages = with pkgs; [
      libreoffice
      gimp
      inkscape
      kicad-small
      remmina

      element-desktop

      feh
      zathura

      pulsemixer

      vlc
      wget
      ffmpeg
      mpv

      btop
      iotop
      sysstat

      magic-wormhole
      man-pages
      tree
      file
      lsof
      psmisc
      zip
      unzip
      ripgrep
      fd
      hyperfine

      mosquitto

      timewarrior
      peaclock

      tio
      picocom

      mob
      vscodium
    ];

    programs.direnv.enable = true;
    programs.direnv.nix-direnv.enable = true;

  };
}
