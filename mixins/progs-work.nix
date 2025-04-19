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

      nrf-command-line-tools
    ];

    programs.direnv.enable = true;
    programs.direnv.nix-direnv.enable = true;

  };

  nixpkgs = {
    config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
      "segger-jlink"
      "nrf-command-line-tools"
    ];
    config.segger-jlink.acceptLicense = true;
    config.permittedInsecurePackages = [
      "segger-jlink-qt4-810"
    ];
  };
}
