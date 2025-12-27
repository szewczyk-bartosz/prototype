{ config, lib, ... }:

let
  themes = import ../../../themes;
  selectedTheme = themes.${config.mikoshi.theme};

  # Check if user wants a preset theme or system theme
  usePresetTheme = config.mikoshi.nvimTheme != null;

  # Generate colorscheme from system theme
  systemColorscheme = {
    bg = selectedTheme.colours.bg or "#000000";
    bg_alt = selectedTheme.colours.bgAlt or "#111111";
    fg = selectedTheme.colours.fg or "#ffffff";
    fg_alt = selectedTheme.colours.fgAlt or "#eeeeee";
    primary = selectedTheme.colours.primary or "#00ff00";
    secondary = selectedTheme.colours.secondary or "#0000ff";
    tertiary = selectedTheme.colours.tertiary or "#ff00ff";
    success = selectedTheme.colours.success or "#00ff00";
    warning = selectedTheme.colours.warning or "#ffaa00";
    error = selectedTheme.colours.error or "#ff0000";
    info = selectedTheme.colours.info or "#00aaff";
    border = selectedTheme.colours.border or "#444444";
    selection = selectedTheme.colours.selection or "#333333";
    hover = selectedTheme.colours.hover or "#222222";
  };

in
{
  programs.nixvim = {
    # If preset theme is specified, use it
    colorschemes = lib.mkIf usePresetTheme {
      # Support common colorscheme names
      ${config.mikoshi.nvimTheme}.enable = true;
    };

    # If no preset theme, generate from system theme
    extraConfigLua = lib.mkIf (!usePresetTheme) ''
      -- Custom colorscheme from Mikoshi theme
      vim.cmd('highlight clear')
      if vim.fn.exists('syntax_on') then
        vim.cmd('syntax reset')
      end

      vim.o.background = 'dark'
      vim.g.colors_name = 'mikoshi'

      local colors = {
        bg = '${systemColorscheme.bg}',
        bg_alt = '${systemColorscheme.bg_alt}',
        fg = '${systemColorscheme.fg}',
        fg_alt = '${systemColorscheme.fg_alt}',
        primary = '${systemColorscheme.primary}',
        secondary = '${systemColorscheme.secondary}',
        tertiary = '${systemColorscheme.tertiary}',
        success = '${systemColorscheme.success}',
        warning = '${systemColorscheme.warning}',
        error = '${systemColorscheme.error}',
        info = '${systemColorscheme.info}',
        border = '${systemColorscheme.border}',
        selection = '${systemColorscheme.selection}',
        hover = '${systemColorscheme.hover}',
      }

      -- Editor highlights
      vim.api.nvim_set_hl(0, 'Normal', { fg = colors.fg, bg = colors.bg })
      vim.api.nvim_set_hl(0, 'NormalFloat', { fg = colors.fg, bg = colors.bg_alt })
      vim.api.nvim_set_hl(0, 'CursorLine', { bg = colors.hover })
      vim.api.nvim_set_hl(0, 'Visual', { bg = colors.selection })
      vim.api.nvim_set_hl(0, 'LineNr', { fg = colors.fg_alt })
      vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = colors.primary, bold = true })
      vim.api.nvim_set_hl(0, 'SignColumn', { bg = colors.bg })

      -- Syntax highlighting
      vim.api.nvim_set_hl(0, 'Comment', { fg = colors.fg_alt, italic = true })
      vim.api.nvim_set_hl(0, 'Keyword', { fg = colors.primary, bold = true })
      vim.api.nvim_set_hl(0, 'Function', { fg = colors.secondary })
      vim.api.nvim_set_hl(0, 'String', { fg = colors.success })
      vim.api.nvim_set_hl(0, 'Number', { fg = colors.tertiary })
      vim.api.nvim_set_hl(0, 'Type', { fg = colors.info })
      vim.api.nvim_set_hl(0, 'Constant', { fg = colors.tertiary })

      -- UI elements
      vim.api.nvim_set_hl(0, 'Pmenu', { fg = colors.fg, bg = colors.bg_alt })
      vim.api.nvim_set_hl(0, 'PmenuSel', { fg = colors.bg, bg = colors.primary })
      vim.api.nvim_set_hl(0, 'StatusLine', { fg = colors.fg, bg = colors.bg_alt })
      vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = colors.fg_alt, bg = colors.bg_alt })
      vim.api.nvim_set_hl(0, 'VertSplit', { fg = colors.border })
      vim.api.nvim_set_hl(0, 'FloatBorder', { fg = colors.border })

      -- Diagnostics
      vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = colors.error })
      vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = colors.warning })
      vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = colors.info })
      vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = colors.fg_alt })

      -- Treesitter
      vim.api.nvim_set_hl(0, '@keyword', { link = 'Keyword' })
      vim.api.nvim_set_hl(0, '@function', { link = 'Function' })
      vim.api.nvim_set_hl(0, '@string', { link = 'String' })
      vim.api.nvim_set_hl(0, '@number', { link = 'Number' })
      vim.api.nvim_set_hl(0, '@type', { link = 'Type' })
      vim.api.nvim_set_hl(0, '@constant', { link = 'Constant' })
    '';
  };
}
