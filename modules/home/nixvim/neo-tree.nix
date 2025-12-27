{ ... }:

{
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;

      closeIfLastWindow = true;
      window = {
        width = 30;
        autoExpandWidth = false;
      };

      filesystem = {
        followCurrentFile = {
          enabled = true;
        };
        filteredItems = {
          hideDotfiles = false;
          hideGitignored = false;
          hideHidden = false;
        };
      };
    };

    # Keybindings for neo-tree
    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Neotree toggle<CR>";
        options = {
          desc = "Toggle file explorer";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>o";
        action = "<cmd>Neotree focus<CR>";
        options = {
          desc = "Focus file explorer";
          silent = true;
        };
      }
    ];
  };
}
