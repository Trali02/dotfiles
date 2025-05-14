{pkgs, lib, ...}:
{
  imports = [
    ./colorscheme.nix
  ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      mini-nvim
      nvim-tree-lua
    ];
 };
}
