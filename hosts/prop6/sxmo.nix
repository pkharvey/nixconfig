{ pkgs, inputs, ... }:
let
  sxmo = builtins.fetchGit {
    url = "https://github.com/wentam/sxmo-nix.git";
    rev = "74129afef2e5ebc874fc3b02bbda863c8c2a0cdc";
  };
in
{
  imports = [
    "${sxmo}/modules/sxmo"
    "${sxmo}/modules/tinydm"
  ];

  nixpkgs.overlays = [
    inputs.nur.overlay
  ];

  networking.networkmanager.enable = true;

  users.users.pasha = {
    extraGroups = [
      "dialout"
      "feedbackd"
      "networkmanager"
      "video"
      "wheel"
    ];
  };

  services.xserver = {
    enable = true;
    desktopManager.sxmo.enable = true;
    desktopManager.sxmo.package = pkgs.nur.repos.colinsane.sxmo-utils.overrideAttrs {
      prePatch = ''
        substituteInPlace scripts/core/sxmo_keyboard.sh \
          --replace 'pidof' 'pidof -x'
        substituteInPlace configs/udev/90-sxmo.rules \
          --replace /bin/chgrp ${pkgs.coreutils}/bin/chgrp \
          --replace /bin/chmod ${pkgs.coreutils}/bin/chmod
      '';
    };

    displayManager = {
      tinydm.enable = true;
      autoLogin.enable = true;
      autoLogin.user = "pasha";
      defaultSession = "swmo";
    };
  };
}
