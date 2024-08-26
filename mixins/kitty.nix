{ config, lib, pkgs, ... }:

{
  home-manager.users.pasha.programs.kitty = {
    enable = true;
    extraConfig = ''
      font_family      Iosevka NFM Medium
      bold_font        Iosevka NFM Bold
      italic_font      Iosevka NFM Medium Italic
      bold_italic_font Iosevka NFM Bold Italic
      font_size        12
    '';
    settings = {
      enable_audio_bell = false;
      copy_on_select = "yes";
    };
  };
}
