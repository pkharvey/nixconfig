{ config, pkgs, ...}:
{
  programs.bash = {
    shellAliases = {
      gitroot="cd $(git rev-parse --show-toplevel || pwd)";
      g="git";
      gd="git diff";
      gl="git log --oneline --decorate --graph --all";
      gll="git log";
      s="git status";
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
              command mkdir "$@" && builtin cd "$@"
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
