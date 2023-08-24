
{ config, lib, pkgs, ... }:
{
# Enable sound with pipewire.
  sound.enable = true;
  programs.noisetorch.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    #media-session.enable = true;
  };

  environment.systemPackages = with pkgs; [
  pavucontrol
  cadence
  qjackctl
  wireplumber
  helvum
  ];
}   
