{ config, pkgs, ...}:
{
  programs.bash = {
    shellAliases = {
      cls="clear";
      ga="git add";
      gb="git branch";
      gc="git commit";
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
      ssh = "env TERM=xterm-256color ssh";
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
    '';
  };
}
