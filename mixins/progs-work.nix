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

      logseq
      leafpad
      feh
      zathura

      pulsemixer

      vlc
      youtube-dl
      wget
      ffmpeg
      mpv

      ruby

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
      peaclock

      picocom

      mob
      vscodium
    ];

    programs.direnv.enable = true;
    programs.direnv.nix-direnv.enable = true;

  };
}
