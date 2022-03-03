{ pkgs, lib, config, ... }:

{
  environment.systemPackages = [
    pkgs.alacritty
  ];

  home-manager.users.pasha = { pkgs, ... }: {
    wayland.windowManager.sway = {
#      extraConfig = ''
#        xwayland disable
#      '';
      enable = true;
      config = {
        modifier = "Mod4";
        terminal = "${pkgs.foot}/bin/foot";
        input = {
          "type:keyboard" = {
            xkb_options = "ctrl:swapcaps";
          };
        };
      };
      wrapperFeatures = {
        base = false;
        gtk = false;
      };
    };
  };
}
