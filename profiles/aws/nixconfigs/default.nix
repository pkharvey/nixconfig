{config, pkgs, lib ,inputs, outputs, ... }:
{
imports = [
   ./theme
	./zsh
	./hypr
	./kitty
    ./waybar
	./wofi
 ];
}
