{config, inputs, outputs, lib, pkgs, ...}:
{
 programs.zsh = {
 #Your zsh config
  dotDir = ".config/zsh";
  syntaxHighlighting.enable = true;
  zplug = {
    enable = true;
    plugins = [
      { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
      { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; } # Installations with additional options. For the list of options, please refer to Zplug README.
    ];
  };
};
}
