{ pkgs, lib, config, ... }:

{
  fonts.enableDefaultFonts = true;

  environment.variables = {
    MOZ_ENABLE_WAYLAND = "1";
    MOZ_USE_XINPUT2 = "1";
    SDL_VIDEODRIVER = "wayland";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "sway";
  };

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
