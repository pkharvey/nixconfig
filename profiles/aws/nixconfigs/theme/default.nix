{
  pkgs,
  config,
  ...
}:
let 
  breath-gtk = import ./breath-gtk.nix {inherit pkgs;};
  gruvboxplus = import ./gruvbox-plus.nix { inherit pkgs; };
in
{

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };
  qt = {
        enable = true;
        
        # platform theme "gtk" or "gnome"
        platformTheme = "gnome";
        
        # name of the theme
        style.name = "adwaita";
        
        # detected automatically:
        # adwaita, adwaita-dark, adwaita-highcontrast,
        # adwaita-highcontrastinverse, breeze,
        # bb10bright, bb10dark, cde, cleanlooks,
        # gtk2, motif, plastique
        
        # package to use
        style.package = pkgs.adwaita-qt;
};
  gtk = {
  enable = true;
  
  cursorTheme.package = pkgs.bibata-cursors;
  cursorTheme.name = "Bibata-Modern-Ice";
  
  theme.package = pkgs.adw-gtk3;
  theme.name = "adw-gtk3";
  
  iconTheme.package = pkgs.zafiro-icons;
  iconTheme.name = "gnome";
    };
  }
