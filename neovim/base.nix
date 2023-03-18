{ config, pkgs, ... }:

{
  programs.neovim = {
    defaultEditor = true;
    enable = true;
    withNodeJs = true;
    # The neovim ruby overrides the one specified in the shell. Great for plugins in ruby, but breaks sorbet's lookups
    withRuby = false;
    # Put some lua-based plugins here as sometimes runtimepath does not always pick them up
    extraLuaPackages = ps: [ ps.plenary-nvim ps.gitsigns-nvim ];
    extraConfig = "lua <<EOF\n" + builtins.readFile ./init.lua + "EOF\n";
    extraPackages = with pkgs; [
      nodePackages.typescript-language-server
      pyright
      lua-language-server
    ];
    plugins = with pkgs.vimPlugins; [
      gitsigns-nvim
      nvim-lspconfig
      vim-surround
      vim-fugitive
      vim-swap
      vim-matchup
      nvim-ts-rainbow
      nvim-autopairs
      vim-illuminate
      split-term-vim
      nvim-web-devicons
      lualine-nvim
      nvim-treesitter-context
      nvim-treesitter-refactor
      which-key-nvim
      lsp_signature-nvim
      luasnip
      friendly-snippets
      nvim-cmp
      cmp-nvim-lsp
      cmp-nvim-lua
      cmp-buffer
      cmp-path
      cmp-treesitter
      cmp_luasnip
      cmp-cmdline
      copilot-lua
      copilot-cmp
      gitlinker-nvim
      telescope-nvim
      telescope-fzf-native-nvim
      vim-oscyank
      catppuccin-nvim
      trouble-nvim
      guess-indent-nvim
    ];
  };
}