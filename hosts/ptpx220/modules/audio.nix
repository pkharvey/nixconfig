# Enable sound.

#sound.enable = true;

#hardware.pulseaudio.enable = true;

{ config, pkgs, lib, ... }:

{
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      #support32Bit = true;
    };
    pulse.enable = true;
  };

  environment.systemPackages = [
    pkgs.helvum
  ];
}

