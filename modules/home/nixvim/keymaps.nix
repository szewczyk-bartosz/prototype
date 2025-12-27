{ ... }:

{
  programs.nixvim = {
    keymaps = [
      # General keymaps
      {
        mode = "n";
        key = "<Esc>";
        action = "<cmd>nohlsearch<CR>";
        options = {
          desc = "Clear search highlighting";
          silent = true;
        };
      }

      # Better window navigation
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
        options = {
          desc = "Move to left window";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
        options = {
          desc = "Move to bottom window";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
        options = {
          desc = "Move to top window";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
        options = {
          desc = "Move to right window";
          silent = true;
        };
      }

      # Resize windows
      {
        mode = "n";
        key = "<C-Up>";
        action = "<cmd>resize +2<CR>";
        options = {
          desc = "Increase window height";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-Down>";
        action = "<cmd>resize -2<CR>";
        options = {
          desc = "Decrease window height";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-Left>";
        action = "<cmd>vertical resize -2<CR>";
        options = {
          desc = "Decrease window width";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-Right>";
        action = "<cmd>vertical resize +2<CR>";
        options = {
          desc = "Increase window width";
          silent = true;
        };
      }

      # Buffer navigation
      {
        mode = "n";
        key = "<S-h>";
        action = "<cmd>bprevious<CR>";
        options = {
          desc = "Previous buffer";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<S-l>";
        action = "<cmd>bnext<CR>";
        options = {
          desc = "Next buffer";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>bd";
        action = "<cmd>bdelete<CR>";
        options = {
          desc = "Delete buffer";
          silent = true;
        };
      }

      # Move text up and down
      {
        mode = "v";
        key = "J";
        action = ":m '>+1<CR>gv=gv";
        options = {
          desc = "Move text down";
          silent = true;
        };
      }
      {
        mode = "v";
        key = "K";
        action = ":m '<-2<CR>gv=gv";
        options = {
          desc = "Move text up";
          silent = true;
        };
      }

      # Better indenting
      {
        mode = "v";
        key = "<";
        action = "<gv";
        options = {
          desc = "Indent left";
          silent = true;
        };
      }
      {
        mode = "v";
        key = ">";
        action = ">gv";
        options = {
          desc = "Indent right";
          silent = true;
        };
      }

      # Keep cursor centered when scrolling
      {
        mode = "n";
        key = "<C-d>";
        action = "<C-d>zz";
        options = {
          desc = "Scroll down and center";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-u>";
        action = "<C-u>zz";
        options = {
          desc = "Scroll up and center";
          silent = true;
        };
      }

      # Search and center
      {
        mode = "n";
        key = "n";
        action = "nzzzv";
        options = {
          desc = "Next search result (centered)";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "N";
        action = "Nzzzv";
        options = {
          desc = "Previous search result (centered)";
          silent = true;
        };
      }

      # LSP keymaps
      {
        mode = "n";
        key = "gd";
        action = "<cmd>lua vim.lsp.buf.definition()<CR>";
        options = {
          desc = "Go to definition";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "gD";
        action = "<cmd>lua vim.lsp.buf.declaration()<CR>";
        options = {
          desc = "Go to declaration";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "gr";
        action = "<cmd>lua vim.lsp.buf.references()<CR>";
        options = {
          desc = "Show references";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "gi";
        action = "<cmd>lua vim.lsp.buf.implementation()<CR>";
        options = {
          desc = "Go to implementation";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "K";
        action = "<cmd>lua vim.lsp.buf.hover()<CR>";
        options = {
          desc = "Show hover information";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>rn";
        action = "<cmd>lua vim.lsp.buf.rename()<CR>";
        options = {
          desc = "Rename symbol";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>ca";
        action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
        options = {
          desc = "Code action";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>d";
        action = "<cmd>lua vim.diagnostic.open_float()<CR>";
        options = {
          desc = "Show diagnostic";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "[d";
        action = "<cmd>lua vim.diagnostic.goto_prev()<CR>";
        options = {
          desc = "Previous diagnostic";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "]d";
        action = "<cmd>lua vim.diagnostic.goto_next()<CR>";
        options = {
          desc = "Next diagnostic";
          silent = true;
        };
      }

      # Format
      {
        mode = "n";
        key = "<leader>f";
        action = "<cmd>lua vim.lsp.buf.format()<CR>";
        options = {
          desc = "Format document";
          silent = true;
        };
      }

      # Color picker
      {
        mode = "n";
        key = "<leader>cp";
        action = "<cmd>CccPick<CR>";
        options = {
          desc = "Pick color";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>ct";
        action = "<cmd>CccHighlighterToggle<CR>";
        options = {
          desc = "Toggle color preview";
          silent = true;
        };
      }
    ];
  };
}
