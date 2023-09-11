{config, inputs, outputs, lib, pkgs, ...}:
{
 
 programs.zsh = {
 #Your zsh config
  enable = true ;
  dotDir = ".config/zsh";
  syntaxHighlighting.enable = true;
  plugins = [
    {
      # will source zsh-autosuggestions.plugin.zsh
      name = "powerlevel10k";
      src = pkgs.fetchFromGitHub {
        owner = "romkatv";
        repo = "powerlevel10k";
        rev = "v1.19.0";
        sha256 = "sha256-+hzjSbbrXr0w1rGHm6m2oZ6pfmD6UUDBfPd7uMg5l5c=";
      };
    }
    {
            name = "powerlevel10k-config";
            src = lib.cleanSource ./p10k-config ;
            file = "p10k.zsh";
    }
    {
      # will source zsh-autosuggestions.plugin.zsh
      name = "zsh-autosuggestions";
      src = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-autosuggestions";
        rev = "v0.7.0";
        sha256 = "sha256-KLUYpUu4DHRumQZ3w59m9aTW6TBKMCXl2UcKi4uMd7w=";
      };
    }
  ];
  initExtraBeforeCompInit = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
    '';
};
}
