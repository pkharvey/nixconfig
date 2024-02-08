{ config, pkgs, ...}:
{
  programs.bash = {
    shellAliases = {
      cls="clear";
      ga="git add";
      gb="git branch";
      gc="git checkout";
      gd="git diff";
      gdc="git diff --cached";
      gl="git log --oneline --decorate --graph --all";
      glb="git log --graph --simplify-by-decoration --pretty=format:'%d' --all";
      gll="git log";
      gr="cd $(git rev-parse --show-toplevel || pwd)";
      s="git status";
      shlvl="echo $SHLVL";
      n="nix-shell -p";
      r="nix repl";
      cdconf="cd /home/pasha/git/nixconfig";
      ssh = "env TERM=xterm-256color ssh";
      icat= "kitten icat";
      cdnrf = "cd /home/pasha/git/nrf-architecture";
      flashsector = "nrfjprog -f NRF91 --sectorerase --verify --reset --program";
      flashchip = "nrfjprog -f NRF91 --chiperase --verify --reset --program";
      flashprod = "(gr && cd production-firmware/build/zephyr && echo -n 'Flashing ' && realpath merged.hex && nrfjprog -f NRF91 --sectorerase --verify --reset --program merged.hex)";
      flashtest = "(gr && cd test-firmware/build/zephyr && echo -n 'Flashing ' && realpath merged.hex && nrfjprog -f NRF91 --chiperase --verify --reset --program merged.hex)";
      flashlte = "nrfjprog -f NRF91 --verify --program /home/pasha/m/nrfmodemfirmware/mfw_nrf9160_1.3.6.zip";
      serialflashprod = "(gr && cd production-firmware/build/zephyr && echo -n 'Flashing ' && realpath app_update.bin && mcumgr image upload app_update.bin -c usb0)";
      serialflashtest = "(gr && cd test-firmware/build/zephyr && echo -n 'Flashing ' && realpath app_update.bin && mcumgr image upload app_update.bin -c usb0)";
      nrfreset = "nrfjprog -f NRF91 --reset";
      gensteps = "(gr && echo -n 'Generating steps within ' && pwd && cd wire-server && bundle exec ruby generate_step_header.rb ../test-firmware/src/steps.h)";
      wireserver = "(gr && echo -n 'Starting wire server within ' && pwd && cd wire-server && bundle exec ruby server.rb /dev/ttyUSB0 3901)";
      nrfcom = "picocom -q /dev/ttyUSB0 -b 38400";
      cucumber = "bundle exec cucumber";
      code = "code --ozone-platform=wayland";
      aebuild = "west build -b aeternum_nrf9160_ns";
    };
    interactiveShellInit = ''
      unalias che >/dev/null 2>&1
      che()
      {
              builtin history -c
              builtin exit
      }

      unalias mcd >/dev/null 2>&1
      mcd()
      {
              command mkdir -p "$@" && builtin cd "$@"
      }

      unalias mml >/dev/null 2>&1
      mml()
      {
              if [[ $# -eq "2" ]] && [[ -O "$1" ]] &&
                 { [[ ! -e "$2" ]] || { [[ -O "$2" ]] && [[ -d "$2" ]]; }; }
              then
                if [[ ! -e "$2" ]]
                then
                  command mkdir -p "$2"
                fi

                if [[ -O "$2" ]] && [[ -d "$2" ]]
                then
                  command mv -i "$1" "$2" &&
                  command ln -s "$2"/"$1" .
                fi
              else
                echo "mkdir and move into destination dir then symlink to"
                echo "if <destination> dir doesn't exist, it will be created"
                echo "Usage: mml <source> <destination>"
              fi
      }

      unalias nt >/dev/null 2>&1
      nt()
      {
              args="$@"
              [[ $# -eq 0 ]] && args='about:newtab'
              command ${pkgs.firefox}/bin/firefox --new-tab --url "$args"
      }

      unalias ws >/dev/null 2>&1
      ws()
      {
              command swaymsg workspace "$@"
      }

      unalias xtitle >/dev/null 2>&1
      xtitle()
      {
              command echo -ne "\033]0;$@\007"
      }

      unalias ifok >/dev/null 2>&1
      ifok()
      {
              [[ $? -eq 0 ]] && "$@"
      }

      unalias ifnok >/dev/null 2>&1
      ifnok()
      {
              [[ $? -ne 0 ]] && "$@"
      }

      unalias nunstable >/dev/null 2>&1
      nunstable()
      {
              command nix shell github:nixos/nixpkgs/nixos-unstable#"$@"
      }
    '';
  };
}
