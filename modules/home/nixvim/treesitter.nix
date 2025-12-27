{ pkgs, ... }:

{
  programs.nixvim = {
    plugins.treesitter = {
      enable = true;
      nixGrammars = true;

      settings = {
        highlight = {
          enable = true;
          additional_vim_regex_highlighting = false;
        };

        indent = {
          enable = true;
        };

        incremental_selection = {
          enable = true;
          keymaps = {
            init_selection = "<C-space>";
            node_incremental = "<C-space>";
            scope_incremental = false;
            node_decremental = "<bs>";
          };
        };
      };

      # Install grammars for our languages
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        rust
        python
        nix
        c
        cpp
        lua
        vim
        vimdoc
        markdown
        markdown_inline
        bash
        json
        toml
        yaml
      ];
    };

    # Treesitter-based text objects
    plugins.treesitter-textobjects = {
      enable = true;
    };

    # Auto-close pairs
    plugins.nvim-autopairs = {
      enable = true;
    };

    # Indent guides
    plugins.indent-blankline = {
      enable = true;
      settings = {
        scope = {
          enabled = true;
          show_start = true;
          show_end = false;
        };
      };
    };

    # Comment toggling
    plugins.comment = {
      enable = true;
    };
  };
}
