{ config, ... }:

let
  themes = import ../../../themes;
  selectedTheme = themes.${config.mikoshi.theme};

  # Get theme colors if using system theme
  useSystemTheme = config.mikoshi.nvimTheme == null;

in
{
  programs.nixvim = {
    plugins = {
      # Status line
      lualine = {
        enable = true;
        settings = {
          options = {
            icons_enabled = true;
            theme = if useSystemTheme then "auto" else config.mikoshi.nvimTheme;
            component_separators = {
              left = "|";
              right = "|";
            };
            section_separators = {
              left = "";
              right = "";
            };
            globalstatus = true;
          };
          sections = {
            lualine_a = [ "mode" ];
            lualine_b = [ "branch" "diff" "diagnostics" ];
            lualine_c = [
              {
                __unkeyed-1 = "filename";
                path = 1;
              }
            ];
            lualine_x = [ "encoding" "fileformat" "filetype" ];
            lualine_y = [ "progress" ];
            lualine_z = [ "location" ];
          };
          inactive_sections = {
            lualine_a = [ ];
            lualine_b = [ ];
            lualine_c = [ "filename" ];
            lualine_x = [ "location" ];
            lualine_y = [ ];
            lualine_z = [ ];
          };
        };
      };

      # Which-key for keybind hints
      which-key = {
        enable = true;
        settings = {
          delay = 500;
          icons = {
            breadcrumb = "»";
            separator = "➜";
            group = "+";
          };
          spec = [
            {
              __unkeyed-1 = "<leader>f";
              group = "Find";
            }
            {
              __unkeyed-1 = "<leader>g";
              group = "Git";
            }
            {
              __unkeyed-1 = "<leader>h";
              group = "Hunk";
            }
            {
              __unkeyed-1 = "<leader>b";
              group = "Buffer";
            }
            {
              __unkeyed-1 = "<leader>c";
              group = "Code";
            }
            {
              __unkeyed-1 = "<leader>t";
              group = "Toggle";
            }
          ];
        };
      };

      # Buffer line (tabs)
      bufferline = {
        enable = true;
        settings = {
          options = {
            mode = "buffers";
            diagnostics = "nvim_lsp";
            separator_style = "slant";
            show_buffer_close_icons = true;
            show_close_icon = false;
            always_show_bufferline = true;
            diagnostics_indicator = ''
              function(count, level, diagnostics_dict, context)
                local s = " "
                for e, n in pairs(diagnostics_dict) do
                  local sym = e == "error" and " "
                    or (e == "warning" and " " or "" )
                  s = s .. n .. sym
                end
                return s
              end
            '';
          };
        };
      };

      # Highlight todo comments
      todo-comments = {
        enable = true;
        settings = {
          signs = true;
          keywords = {
            FIX = {
              icon = " ";
              color = "error";
              alt = [ "FIXME" "BUG" "FIXIT" "ISSUE" ];
            };
            TODO = {
              icon = " ";
              color = "info";
            };
            HACK = {
              icon = " ";
              color = "warning";
            };
            WARN = {
              icon = " ";
              color = "warning";
              alt = [ "WARNING" "XXX" ];
            };
            PERF = {
              icon = " ";
              alt = [ "OPTIM" "PERFORMANCE" "OPTIMIZE" ];
            };
            NOTE = {
              icon = " ";
              color = "hint";
              alt = [ "INFO" ];
            };
          };
        };
      };

      # Smooth scrolling
      nvim-scrollbar = {
        enable = true;
        settings = {
          handle = {
            color = "#3b4252";
          };
          marks = {
            Search = {
              color = "#88c0d0";
            };
            Error = {
              color = "#bf616a";
            };
            Warn = {
              color = "#ebcb8b";
            };
            Info = {
              color = "#81a1c1";
            };
            Hint = {
              color = "#a3be8c";
            };
          };
        };
      };

      # Better notifications
      notify = {
        enable = true;
        timeout = 3000;
        maxWidth = 50;
        render = "default";
        stages = "fade_in_slide_out";
      };

      # Colorize color codes
      nvim-colorizer = {
        enable = true;
        userDefaultOptions = {
          RGB = true;
          RRGGBB = true;
          names = false;
          RRGGBBAA = true;
          rgb_fn = true;
          hsl_fn = true;
          css = true;
          css_fn = true;
        };
      };
    };
  };
}
