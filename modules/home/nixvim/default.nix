{ config, pkgs, ... }:

{
  imports = [
    ./lsp.nix
    ./completion.nix
    ./treesitter.nix
    ./telescope.nix
    ./neo-tree.nix
    ./git.nix
    ./theme.nix
    ./keymaps.nix
    ./ui.nix
  ];

  programs.nixvim = {
    enable = true;

    # Use space as leader key
    globals.mapleader = " ";
    globals.maplocalleader = " ";

    # Basic editor settings
    opts = {
      # Line numbers
      number = true;
      relativenumber = true;

      # Tabs and indentation
      tabstop = 4;
      shiftwidth = 4;
      expandtab = true;
      autoindent = true;
      smartindent = true;

      # Search settings
      ignorecase = true;
      smartcase = true;
      hlsearch = true;
      incsearch = true;

      # Appearance
      termguicolors = true;
      signcolumn = "yes";
      cursorline = true;
      scrolloff = 8;
      sidescrolloff = 8;

      # Behavior
      mouse = "a";
      clipboard = "unnamedplus";
      undofile = true;
      swapfile = false;
      backup = false;
      updatetime = 250;
      timeoutlen = 300;

      # Split windows
      splitright = true;
      splitbelow = true;

      # Completion
      completeopt = "menuone,noselect";
    };

    # Additional vim options
    extraConfigVim = ''
      " Enable filetype detection, plugins, and indent
      filetype plugin indent on
    '';
  };
}
