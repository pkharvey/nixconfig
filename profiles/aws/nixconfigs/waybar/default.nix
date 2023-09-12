{config, inputs, outputs, lib, pkgs, ...}:
{ 
 programs.waybar = {
    settings =[
	
	{
	    "layer": "top",
	    "position": "top",
	    "height": 15,
	
	    "modules-left": ["hyprland/workspaces"],
	    "modules-center": ["clock"],
	    "modules-right": ["tray", "custom/spotify", "pulseaudio", "network", "idle_inhibitor"],
	   
	   
	    "clock": {
	        "format": "{:%H:%M}",
	        "tooltip": false
	    },
	    "battery": {
	        "format": "{capacity}% {icon}",
	        "format-alt": "{time} {icon}",
	        "format-icons": ["", "", "", "", ""],
	        "format-charging": "{capacity}% ",
	        "interval": 30,
	        "states": {
	            "warning": 25,
	            "critical": 10
	        },
	        "tooltip": false
	    },
	    "network": {
	        "format-wifi": "{ipaddr} {essid} ({signalStrength}%) {icon}",
	  	"format-ethernet": "{ipaddr}  {ifname} {icon}",
	        "format-alt": "{icon}",
	        "format-alt-click": "click-right",
		"format-icons": {
	            "wifi": [""],
	            "ethernet": [""],
	            "disconnected": ["X"]
	        },
	        "on-click": "",
	    "tooltip": false
	    },
	    "pulseaudio": {
	        "format-alt": "{icon}",
	        "format": "{volume}% {icon}",
	        "format-alt-click": "click-right",
	        "format-muted": "",
	        "format-icons": {
	            "phone": [" ", " ", " "],
	            "default": ["", "", ""]
	        },
	        "scroll-step": 10,
	        "on-click": "pavucontrol",
	        "tooltip": false
	    },
	    "custom/spotify": {
	        "interval": 1,
	        "return-type": "json",
	        "exec": "~/.config/waybar/modules/spotify.sh",
	        "exec-if": "pgrep spotify",
	        "escape": true
	    },
	    "custom/storage": {
	        "format": "{} ",
	        "format-alt": "{percentage}% ",
	        "format-alt-click": "click-right",
	        "return-type": "json",
	        "interval": 60,
	        "exec": "~/.config/waybar/modules/storage.sh"
	    },
	    "backlight": {
	        "format": "{icon}",
	        "format-alt": "{percent}% {icon}",
	        "format-alt-click": "click-right",
	        "format-icons": ["", ""],
	        "on-scroll-down": "light -A 1",
	        "on-scroll-up": "light -U 1"
	    },
	    "custom/weather": {
	        "format": "{}",
	        "format-alt": "{alt}: {}",
	        "format-alt-click": "click-right",
	        "interval": 1800,
	        "return-type": "json",
	        "exec": "~/.config/waybar/modules/weather.sh",
	        "exec-if": "ping wttr.in -c1"
	    },
	    "idle_inhibitor": {
	        "format": "{icon}",
	        "format-icons": {
	            "activated": "",
	            "deactivated": ""
	        },
	        "tooltip": false
	    },
	    "custom/mail": {
	        "format": "",
	        "format-alt": "{alt} ",
	        "format-alt-click": "click-right",
	        "interval": 60,
	        "return-type": "json",
	        "exec": "~/.config/waybar/modules/mail.py",
	        "tooltip": false
	    },
	    "custom/test": {
	        "format": "{}",
	        "exec": "/tmp/test blub",
	        "param": "blah",
	        "interval": 5
	    },
	    "tray": {
	        "icon-size": 18
	    }
	}


    ]; 
    style = ''
   * {
                 font-family: "JetBrainsMono Nerd Font";
                 font-size: 12pt;
                 font-weight: bold;
                 border-radius: 0px;
                 transition-property: background-color;
                 transition-duration: 0.5s;
               }
               @keyframes blink_red {
                 to {
                   background-color: rgb(242, 143, 173);
                   color: rgb(26, 24, 38);
                 }
               }
               .warning, .critical, .urgent {
                 animation-name: blink_red;
                 animation-duration: 1s;
                 animation-timing-function: linear;
                 animation-iteration-count: infinite;
                 animation-direction: alternate;
               }
               window#waybar {
                 background-color: transparent;
               }
               window > box {
                 margin-left: 5px;
                 margin-right: 5px;
                 margin-top: 5px;
                 background-color: rgb(30, 30, 46);
               }
         #workspaces {
                 padding-left: 0px;
                 padding-right: 4px;
               }
         #workspaces button {
                 padding-top: 5px;
                 padding-bottom: 5px;
                 padding-left: 6px;
                 padding-right: 6px;
               }
         #workspaces button.active {
                 background-color: rgb(181, 232, 224);
                 color: rgb(26, 24, 38);
               }
         #workspaces button.urgent {
                 color: rgb(26, 24, 38);
               }
         #workspaces button:hover {
                 background-color: rgb(248, 189, 150);
                 color: rgb(26, 24, 38);
               }
               tooltip {
                 background: rgb(48, 45, 65);
               }
               tooltip label {
                 color: rgb(217, 224, 238);
               }
         #custom-launcher {
                 font-size: 20px;
                 padding-left: 8px;
                 padding-right: 6px;
                 color: #7ebae4;
               }
         #mode, #clock, #memory, #temperature,#cpu,#mpd, #custom-wall, #temperature, #backlight, #pulseaudio, #network, #battery, #custom-powermenu, #custom-cava-internal {
                 padding-left: 10px;
                 padding-right: 10px;
               }
               /* #mode { */
               /* 	margin-left: 10px; */
               /* 	background-color: rgb(248, 189, 150); */
               /*     color: rgb(26, 24, 38); */
               /* } */
         #memory {
                 color: rgb(181, 232, 224);
               }
         #cpu {
                 color: rgb(245, 194, 231);
               }
         #clock {
                 color: rgb(217, 224, 238);
               }
        /* #idle_inhibitor {
                 color: rgb(221, 182, 242);
               }*/
         #custom-wall {
                 color: rgb(221, 182, 242);
            }
         #temperature {
                 color: rgb(150, 205, 251);
               }
         #backlight {
                 color: rgb(248, 189, 150);
               }
         #pulseaudio {
                 color: rgb(245, 224, 220);
               }
         #network {
                 color: #ABE9B3;
               }

         #network.disconnected {
                 color: rgb(255, 255, 255);
               }
         #battery.charging, #battery.full, #battery.discharging {
                 color: rgb(250, 227, 176);
               }
         #battery.critical:not(.charging) {
                 color: rgb(242, 143, 173);
               }
         #custom-powermenu {
                 color: rgb(242, 143, 173);
               }
         #tray {
                 padding-right: 8px;
                 padding-left: 10px;
               }
         #mpd.paused {
                 color: #414868;
                 font-style: italic;
               }
         #mpd.stopped {
                 background: transparent;
               }
         #mpd {
                 color: #c0caf5;
               }
         #custom-cava-internal{
                 font-family: "Hack Nerd Font" ;
               }
   '';
   
 };
}
