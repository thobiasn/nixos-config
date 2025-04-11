{ pkgs, inputs, username, ... }:
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    withNodeJs = true;
    withPython3 = false;
    withRuby = false;
  };

  home.file.".config/nvim".source = "/home/${username}/nvim-config";
}
