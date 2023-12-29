{ config, pkgs, lib, ... }:
{
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
    };
    pulse.enable = true;
  };
  environment.systemPackages = [
    pkgs.helvum
  ];
  home-manager.users.pasha = { pkgs, ... }: {
    home.packages = with pkgs; [
      fluidsynth
      soundfont-ydp-grand
      polyphone
      alsa-utils
      vmpk
    ];
  };
}

