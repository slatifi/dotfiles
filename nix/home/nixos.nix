{ pkgs, config, ... }: 
{
  programs.alacritty = {
    enable = true;
    settings = {
      terminal.shell = "${pkgs.zsh}/bin/zsh";
    };
  };

  programs.bash.enable = true;
}
