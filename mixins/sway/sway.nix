{ config, pkgs, lib, ... }:
{
  services.dbus.packages = with pkgs; [ dconf ];

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
    };
  };

  # The NixOS option 'programs.sway.enable' is needed to make swaylock work,
  # since home-manager can't set PAM up to allow unlocks, along with some
  # other quirks.
  programs.sway.enable = true;

  # For controlling backlights
  programs.light.enable = true;

  fonts.packages = with pkgs; [
    terminus_font_ttf
    font-awesome
    nerd-fonts.iosevka
  ];
  home-manager.users.pasha = { pkgs, ... }: {

    # Block auto-sway reload, Sway crashes if allowed to reload this way.
    xdg.configFile."sway/config".onChange = lib.mkForce "";

    home.sessionVariables = {
      MOZ_ENABLE_WAYLAND = "1";
      MOZ_USE_XINPUT2 = "1";
      #WLR_DRM_NO_MODIFIERS = "1";
      SDL_VIDEODRIVER = "wayland";
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      _JAVA_AWT_WM_NONREPARENTING = "1";
      XDG_SESSION_TYPE = "wayland";
      XDG_CURRENT_DESKTOP = "sway";
    };
    home.packages = with pkgs; [
      wl-clipboard
      imv
      i3status
    ];
  };
}
