{config, pkgs, lib ,inputs, outputs, ... }:
{
imports = [
   ./theme
	./zsh
	./kitty
    ./waybar
	./wofi
 ];
}
