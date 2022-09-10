{ config, pkgs, lib, inputs, ...}:
{
  home-manager.users.pasha = { pkgs, ... }: {
    home.packages = with pkgs; [
      libreoffice
      gimp
      inkscape
      kicad

      element-desktop

      leafpad
      free42
      feh
      zathura

      pulsemixer
      pavucontrol

      vlc
      youtube-dl
      ffmpeg
      mpv

      ruby

      btop
      iotop
      sysstat

      man-pages
      tree
      file
      lsof
      psmisc
      unzip
      ripgrep

      atom
    ];
  };
}
