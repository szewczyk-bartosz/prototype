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
              group = "Color/Code";
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
            indicator = {
              style = "icon";
            };
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

      # Noice - centered command line and better UI
      noice = {
        enable = true;
        settings = {
          cmdline = {
            enabled = true;
            view = "cmdline_popup";
          };
          messages = {
            enabled = true;
          };
          popupmenu = {
            enabled = true;
            backend = "nui";
          };
          notify = {
            enabled = true;
          };
          lsp = {
            override = {
              "vim.lsp.util.convert_input_to_markdown_lines" = true;
              "vim.lsp.util.stylize_markdown" = true;
              "cmp.entry.get_documentation" = true;
            };
            progress = {
              enabled = true;
            };
          };
          presets = {
            bottom_search = true;
            command_palette = true;
            long_message_to_split = true;
            inc_rename = false;
            lsp_doc_border = true;
          };
          views = {
            cmdline_popup = {
              position = {
                row = "50%";
                col = "50%";
              };
              size = {
                width = 60;
                height = "auto";
              };
            };
            popupmenu = {
              relative = "editor";
              position = {
                row = "60%";
                col = "50%";
              };
              size = {
                width = 60;
                height = 10;
              };
            };
          };
        };
      };

      # Color picker and previewer
      ccc = {
        enable = true;
        settings = {
          highlighter = {
            auto_enable = true;
            lsp = true;
          };
        };
      };
    };

    # Custom bufferline highlights applied via extraConfigLua
    extraConfigLua = ''
      -- Set bufferline highlights for selected tabs
      local primary = '${selectedTheme.colours.primary}'
      local onPrimary = '${selectedTheme.colours.onPrimary}'

      -- Main buffer/tab elements
      vim.api.nvim_set_hl(0, 'BufferLineBufferSelected', {
        fg = onPrimary,
        bg = primary,
        bold = true
      })
      vim.api.nvim_set_hl(0, 'BufferLineTabSelected', {
        fg = onPrimary,
        bg = primary,
        bold = true
      })

      -- Icon and file type (set all DevIcon variants)
      vim.api.nvim_set_hl(0, 'BufferLineDevIconSelected', {
        fg = onPrimary,
        bg = primary
      })

      -- Set all possible DevIcon variants for different file types
      local filetypes = {
        'Lua', 'Nix', 'Rust', 'Python', 'C', 'Cpp', 'Go', 'JavaScript',
        'TypeScript', 'Markdown', 'Json', 'Yaml', 'Toml', 'Vim', 'Bash',
        'Default'
      }
      for _, ft in ipairs(filetypes) do
        vim.api.nvim_set_hl(0, 'BufferLineDevIcon' .. ft .. 'Selected', {
          fg = onPrimary,
          bg = primary
        })
      end

      -- Numbers
      vim.api.nvim_set_hl(0, 'BufferLineNumbersSelected', {
        fg = onPrimary,
        bg = primary,
        bold = true
      })

      -- Close button
      vim.api.nvim_set_hl(0, 'BufferLineCloseButtonSelected', {
        fg = onPrimary,
        bg = primary
      })

      -- Modified indicator
      vim.api.nvim_set_hl(0, 'BufferLineModifiedSelected', {
        fg = onPrimary,
        bg = primary
      })

      -- Diagnostics
      vim.api.nvim_set_hl(0, 'BufferLineDiagnosticSelected', {
        fg = onPrimary,
        bg = primary
      })
      vim.api.nvim_set_hl(0, 'BufferLineErrorSelected', {
        fg = onPrimary,
        bg = primary
      })
      vim.api.nvim_set_hl(0, 'BufferLineWarningSelected', {
        fg = onPrimary,
        bg = primary
      })
      vim.api.nvim_set_hl(0, 'BufferLineInfoSelected', {
        fg = onPrimary,
        bg = primary
      })
      vim.api.nvim_set_hl(0, 'BufferLineHintSelected', {
        fg = onPrimary,
        bg = primary
      })

      -- Separators
      vim.api.nvim_set_hl(0, 'BufferLineSeparatorSelected', {
        fg = primary,
        bg = primary
      })
      vim.api.nvim_set_hl(0, 'BufferLineIndicatorSelected', {
        fg = primary,
        bg = primary
      })

      -- Duplicate and pick
      vim.api.nvim_set_hl(0, 'BufferLineDuplicateSelected', {
        fg = onPrimary,
        bg = primary
      })
      vim.api.nvim_set_hl(0, 'BufferLinePickSelected', {
        fg = onPrimary,
        bg = primary,
        bold = true
      })

      -- Also set "Visible" variants (for the currently focused buffer)
      vim.api.nvim_set_hl(0, 'BufferLineBufferVisible', {
        fg = onPrimary,
        bg = primary,
        bold = true
      })
      vim.api.nvim_set_hl(0, 'BufferLineTabVisible', {
        fg = onPrimary,
        bg = primary,
        bold = true
      })
      vim.api.nvim_set_hl(0, 'BufferLineNumbersVisible', {
        fg = onPrimary,
        bg = primary
      })
      vim.api.nvim_set_hl(0, 'BufferLineCloseButtonVisible', {
        fg = onPrimary,
        bg = primary
      })
      vim.api.nvim_set_hl(0, 'BufferLineSeparatorVisible', {
        fg = primary,
        bg = primary
      })
      for _, ft in ipairs(filetypes) do
        vim.api.nvim_set_hl(0, 'BufferLineDevIcon' .. ft .. 'Visible', {
          fg = onPrimary,
          bg = primary
        })
      end
    '';
  };
}
