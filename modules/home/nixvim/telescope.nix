{ ... }:

{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;

      keymaps = {
        # Find files
        "<leader>ff" = {
          action = "find_files";
          options.desc = "Find files";
        };

        # Find in current buffer
        "<leader>/" = {
          action = "current_buffer_fuzzy_find";
          options.desc = "Search in current buffer";
        };

        # Live grep
        "<leader>fg" = {
          action = "live_grep";
          options.desc = "Live grep";
        };

        # Find buffers
        "<leader>fb" = {
          action = "buffers";
          options.desc = "Find buffers";
        };

        # Find help tags
        "<leader>fh" = {
          action = "help_tags";
          options.desc = "Find help";
        };

        # Find recent files
        "<leader>fr" = {
          action = "oldfiles";
          options.desc = "Find recent files";
        };

        # Git files
        "<leader>gf" = {
          action = "git_files";
          options.desc = "Find git files";
        };
      };

      settings = {
        defaults = {
          file_ignore_patterns = [
            "^.git/"
            "^.mypy_cache/"
            "^__pycache__/"
            "^output/"
            "^data/"
            "%.ipynb"
          ];
          set_env.COLORTERM = "truecolor";
          mappings = {
            i = {
              "<C-j>" = {
                __raw = "require('telescope.actions').move_selection_next";
              };
              "<C-k>" = {
                __raw = "require('telescope.actions').move_selection_previous";
              };
            };
          };
        };
      };

      extensions = {
        fzf-native = {
          enable = true;
        };
      };
    };
  };
}
