{ pkgs, inputs, ... }:
{
  imports = [ inputs.nvf.homeManagerModules.default ];

  programs.neovim = {
    enable = true;
    vimAlias = true;
  };
}
