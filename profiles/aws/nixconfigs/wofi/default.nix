{ inputs, outputs, lib, config, pkgs, ... }:
{
    programs.wofi.enable = true;
    programs.wofi.settings = {
	width=420;
	height=550;
	location="center";
	show="drun";
	matching="fuzzy";
	prompt="Search...";
	filter_rate=100;
	allow_markup=true;
	no_actions=true;
	halign="fill";
	orientation="vertical";
	content_halign="fill";
	insensitive=true;
	allow_images=true;
	image_size=28;
	gtk_dark=false;
	term=kitty;
    };

    programs.wofi.style = ''
    	 window {
    	 margin: 0px;
    	 border: 1px solid #88c0d0;
    	 background-color: #2e3440;
    	 }
    	 
    	 #input {
    	 margin: 5px;
    	 border: none;
    	 color: #d8dee9;
    	 background-color: #3b4252;
    	 }
    	 
    	 #inner-box {
    	 margin: 5px;
    	 border: none;
    	 background-color: #2e3440;
    	 }
    	 
    	 #outer-box {
    	 margin: 5px;
    	 border: none;
    	 background-color: #2e3440;
    	 }
    	 
    	 #scroll {
    	 margin: 0px;
    	 border: none;
    	 }
    	 
    	 #text {
    	 margin: 5px;
    	 border: none;
    	 color: #d8dee9;
    	 }
    	 
    	 #entry:selected {
    	 background-color: #3b4252;
    	 }
    ''
}
