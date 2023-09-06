{ inputs, outputs, lib, config, pkgs, share, ... }:
let
  path = name: share "hyprland/${name}";
  wrap = name: config.lib.file.mkOutOfStoreSymlink (path name);
in
{
  home.packages = with pkgs; [
    # Components
    avizo
    dolphin
    mako
    mpvpaper
    swayidle
    swaylock-effects
    libsForQt5.dolphin
    libsForQt5.dolphin-plugins
    # Utilities
    wlr-randr
    wl-clipboard
    xdg-utils
    #Utils2
    
    pavucontrol
    polkit_gnome
    qjackctl
    bemenu
    xorg.xhost
    way-displays
    xdg-desktop-portal-hyprland
    blueberry
    connman-gtk
  ];

  xdg.configFile = {
    hypr.source = wrap "hypr";
    mako.source = wrap "mako";
    avizo.source = wrap "avizo";
    swayidle.source = wrap "swayidle";
    swaylock.source = wrap "swaylock";
  };
}
