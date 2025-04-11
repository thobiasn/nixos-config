{ pkgs, inputs, ... }:
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    withNodeJs = true;
    withPython3 = false;
    withRuby = false;
  };

  home.file.".config/nvim".source = "./config";
}
