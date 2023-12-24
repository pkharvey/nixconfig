{ pkgs, lib, config, inputs, ... }:
let
  switchToRussian = pkgs.writeScript "switchToRussian.sh" ''
    currentLayout=$(swaymsg -t get_inputs -r | ${pkgs.jq}/bin/jq -r "[.[] | select(.xkb_active_layout_name != null)][0].xkb_active_layout_name")
    if [ "$currentLayout" = "Russian" ]; then
      ${switchUSVariant}
    else
      swaymsg input type:keyboard xkb_layout ru
    fi
  '';
  switchUSVariant = pkgs.writeScript "switchUSVariant.sh" ''
    currentLayout=$(swaymsg -t get_inputs -r | ${pkgs.jq}/bin/jq -r "[.[] | select(.xkb_active_layout_name != null)][0].xkb_active_layout_name")
    lastKnownLayout=$(cat /dev/shm/currentXKBVariant)

    swaymsg input type:keyboard xkb_layout "'$lastKnownLayout'"

    if [ "$currentLayout" = "English (US)" ]; then
      swaymsg input type:keyboard xkb_layout 'us(dvorak)' && echo "us(dvorak)" > /dev/shm/currentXKBVariant
    elif [ "$currentLayout" = "English (Dvorak)" ]; then
      swaymsg input type:keyboard xkb_layout 'us(colemak)' && echo "us(colemak)" > /dev/shm/currentXKBVariant
    elif [ "$currentLayout" = "English (Colemak)" ]; then
      swaymsg input type:keyboard xkb_layout 'us(workman)' && echo "us(workman)" > /dev/shm/currentXKBVariant
    elif [ "$currentLayout" = "English (Workman)" ]; then
      swaymsg input type:keyboard xkb_layout 'us' && echo "us" > /dev/shm/currentXKBVariant
    fi
  '';
in
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
      config = rec {
        startup = [
          { always = true; command = "${pkgs.mako}/bin/mako --default-timeout 3000"; }
        ];
        keybindings = lib.mkOptionDefault {
          "${modifier}+F10" = "exec ${inputs.firefox.packages.${pkgs.hostPlatform.system}.firefox-nightly-bin}/bin/firefox";
          "${modifier}+F11" = "exec ${switchToRussian}";
          "${modifier}+F12" = "exec ${switchUSVariant}";

          "${modifier}+control+Escape" = "kill";

          "shift+Print"             = "exec ${pkgs.grim}/bin/grim - | ${pkgs.wl-clipboard}/bin/wl-copy -t image/png";
          "Print"                   = "exec ${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp -d)\" - | ${pkgs.wl-clipboard}/bin/wl-copy -t image/png";

          "${modifier}+c" = "exec ${pkgs.free42}/bin/free42dec";

          "${modifier}+control+Prior" = "focus left";
          "${modifier}+control+Next"  = "focus right";
          "XF86Back"                  = "focus left";
          "XF86Forward"               = "focus right";
          "${modifier}+Left"          = "focus left";
          "${modifier}+Down"          = "focus down";
          "${modifier}+Up"            = "focus up";
          "${modifier}+Right"         = "focus right";
          "${modifier}+Mod1+Left"     = "focus output left";
          "${modifier}+Mod1+Down"     = "focus output down";
          "${modifier}+Mod1+Up"       = "focus output up";
          "${modifier}+Mod1+Right"    = "focus output right";
          "${modifier}+Mod1+h"        = "focus output left";
          "${modifier}+Mod1+j"        = "focus output down";
          "${modifier}+Mod1+k"        = "focus output up";
          "${modifier}+Mod1+l"        = "focus output right";
          "${modifier}+XF86Back"      = "workspace prev";
          "${modifier}+XF86Forward"   = "workspace next";
          "${modifier}+Prior"         = "workspace prev";
          "${modifier}+Next"          = "workspace next";
          "${modifier}+Tab"           = "workspace back_and_forth";
          "${modifier}+Shift+Tab"     = "move container to workspace back_and_forth";
          "${modifier}+Control+Tab"   = "move container to workspace back_and_forth; workspace back_and_forth";

          "XF86AudioMute"        = "exec ${pkgs.pamixer} --toggle-mute";
          "XF86AudioLowerVolume" = "exec ${pkgs.pamixer} --decrease 5";
          "XF86AudioRaiseVolume" = "exec ${pkgs.pamixer} --increase 5";
          "XF86AudioMicMute"     = "exec ${pkgs.pamixer} --default-source --toggle-mute";
          "Pause"                = "exec ${pkgs.playerctl}/bin/playerctl -a pause";
          "Shift+Pause"          = "exec ${pkgs.playerctl}/bin/playerctl play-pause";

          "XF86AudioStop" = "exec ${pkgs.playerctl}/bin/playerctl stop";
          "XF86AudioPrev" = "exec ${pkgs.playerctl}/bin/playerctl previous";
          "XF86AudioPlay" = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
          "XF86AudioNext" = "exec ${pkgs.playerctl}/bin/playerctl next";

          "${modifier}+0" = "workspace number 10";
          "${modifier}+Shift+0" = "move container to workspace number 10";

          "${modifier}+Control+1" = "move container to workspace number 1; workspace 1";
          "${modifier}+Control+2" = "move container to workspace number 2; workspace 2";
          "${modifier}+Control+3" = "move container to workspace number 3; workspace 3";
          "${modifier}+Control+4" = "move container to workspace number 4; workspace 4";
          "${modifier}+Control+5" = "move container to workspace number 5; workspace 5";
          "${modifier}+Control+6" = "move container to workspace number 6; workspace 6";
          "${modifier}+Control+7" = "move container to workspace number 7; workspace 7";
          "${modifier}+Control+8" = "move container to workspace number 8; workspace 8";
          "${modifier}+Control+9" = "move container to workspace number 9; workspace 9";
          "${modifier}+Control+0" = "move container to workspace number 10; workspace 10";
        };
        modifier = "Mod4";
        terminal = "${pkgs.kitty}/bin/kitty";
        input = {
          "type:keyboard" = {
            xkb_options = "ctrl:swapcaps";
          };
        };
      };
      config.bars =
        [
          {
            mode = "hide";
            statusCommand = "${pkgs.i3status}/bin/i3status";
          }
        ];
      wrapperFeatures = {
        base = false;
        gtk = false;
      };
    };
  };
}
