{ config, ... }:

let
  themes = import ../../themes;
  selectedTheme = themes.${config.mikoshi.theme};
in
{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;

    settings = {
      manager = {
        show_hidden = false;
        show_symlink = true;
        sort_by = "natural";
        sort_dir_first = true;
        sort_reverse = false;
      };

      preview = {
        max_width = 600;
        max_height = 900;
      };
    };

    theme = {
      manager = {
        cwd = {
          fg = selectedTheme.colours.primary;
        };
        hovered = {
          fg = selectedTheme.colours.onPrimary;
          bg = selectedTheme.colours.primary;
        };
        preview_hovered = {
          underline = true;
        };
        find_keyword = {
          fg = selectedTheme.colours.warning;
          italic = true;
        };
        find_position = {
          fg = selectedTheme.colours.info;
          bg = "reset";
          italic = true;
        };
        marker_selected = {
          fg = selectedTheme.colours.success;
          bg = selectedTheme.colours.success;
        };
        marker_copied = {
          fg = selectedTheme.colours.warning;
          bg = selectedTheme.colours.warning;
        };
        marker_cut = {
          fg = selectedTheme.colours.error;
          bg = selectedTheme.colours.error;
        };
        tab_active = {
          fg = selectedTheme.colours.fg;
          bg = selectedTheme.colours.bgAlt;
        };
        tab_inactive = {
          fg = selectedTheme.colours.fgAlt;
          bg = selectedTheme.colours.bg;
        };
        border_symbol = "│";
        border_style = {
          fg = selectedTheme.colours.border;
        };
      };

      status = {
        separator_open = "";
        separator_close = "";
        separator_style = {
          fg = selectedTheme.colours.border;
          bg = selectedTheme.colours.border;
        };
        mode_normal = {
          fg = selectedTheme.colours.bg;
          bg = selectedTheme.colours.primary;
          bold = true;
        };
        mode_select = {
          fg = selectedTheme.colours.bg;
          bg = selectedTheme.colours.success;
          bold = true;
        };
        mode_unset = {
          fg = selectedTheme.colours.bg;
          bg = selectedTheme.colours.warning;
          bold = true;
        };
        progress_label = {
          fg = selectedTheme.colours.fg;
          bold = true;
        };
        progress_normal = {
          fg = selectedTheme.colours.primary;
          bg = selectedTheme.colours.bgAlt;
        };
        progress_error = {
          fg = selectedTheme.colours.error;
          bg = selectedTheme.colours.bgAlt;
        };
        permissions_t = {
          fg = selectedTheme.colours.success;
        };
        permissions_r = {
          fg = selectedTheme.colours.warning;
        };
        permissions_w = {
          fg = selectedTheme.colours.error;
        };
        permissions_x = {
          fg = selectedTheme.colours.info;
        };
        permissions_s = {
          fg = selectedTheme.colours.fgAlt;
        };
      };

      input = {
        border = {
          fg = selectedTheme.colours.primary;
        };
        title = { };
        value = { };
        selected = {
          reversed = true;
        };
      };

      select = {
        border = {
          fg = selectedTheme.colours.primary;
        };
        active = {
          fg = selectedTheme.colours.onPrimary;
          bg = selectedTheme.colours.primary;
        };
        inactive = { };
      };

      tasks = {
        border = {
          fg = selectedTheme.colours.primary;
        };
        title = { };
        hovered = {
          underline = true;
        };
      };

      which = {
        cols = 3;
        mask = {
          bg = selectedTheme.colours.bg;
        };
        cand = {
          fg = selectedTheme.colours.fg;
        };
        rest = {
          fg = selectedTheme.colours.fgAlt;
        };
        desc = {
          fg = selectedTheme.colours.info;
        };
        separator = "  ";
        separator_style = {
          fg = selectedTheme.colours.border;
        };
      };

      help = {
        on = {
          fg = selectedTheme.colours.success;
        };
        exec = {
          fg = selectedTheme.colours.info;
        };
        desc = {
          fg = selectedTheme.colours.fgAlt;
        };
        hovered = {
          bg = selectedTheme.colours.selection;
          bold = true;
        };
        footer = {
          fg = selectedTheme.colours.fg;
          bg = selectedTheme.colours.bgAlt;
        };
      };

      filetype = {
        rules = [
          { mime = "image/*"; fg = selectedTheme.colours.info; }
          { mime = "video/*"; fg = selectedTheme.colours.warning; }
          { mime = "audio/*"; fg = selectedTheme.colours.secondary; }
          { mime = "application/zip"; fg = selectedTheme.colours.error; }
          { mime = "application/gzip"; fg = selectedTheme.colours.error; }
          { mime = "application/x-tar"; fg = selectedTheme.colours.error; }
          { mime = "application/x-bzip"; fg = selectedTheme.colours.error; }
          { mime = "application/x-7z-compressed"; fg = selectedTheme.colours.error; }
          { mime = "application/x-rar"; fg = selectedTheme.colours.error; }
        ];
      };
    };

    keymap = {
      manager.prepend_keymap = [
        { on = [ "<Esc>" ]; run = "escape"; desc = "Exit visual mode, clear selected, or cancel search"; }
        { on = [ "q" ]; run = "quit"; desc = "Exit the process"; }
        { on = [ "<C-q>" ]; run = "close"; desc = "Close the current tab, or quit if it is last tab"; }
      ];
    };
  };
}
