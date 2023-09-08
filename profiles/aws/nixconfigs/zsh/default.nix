{inputs, outputs, lib, pkgs, ...}:
{
 programs.zsh = {
 # Your zsh config
  dotDir = ".config/zsh";
  syntaxHighlighting.enable = true;
  plugins = [
    #{
      # will source zsh-autosuggestions.plugin.zsh
      #name = "zsh-autosuggestions";
      #src = ;
    #}
    {
      name = "enhancd";
      file = "init.sh";
      src = pkgs.fetchFromGitHub {
        owner = "b4b4r07";
        repo = "enhancd";
        rev = "v2.2.1";
        sha256 = "0iqa9j09fwm6nj5rpip87x3hnvbbz9w9ajgm6wkrd5fls8fn8i5g";
      };
    }
  ];
};
}
