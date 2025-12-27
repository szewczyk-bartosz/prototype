{ config, ... }:

let
  themes = import ../../themes;
  selectedTheme = themes.${config.mikoshi.theme};
in
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      format = "$all";
      add_newline = true;

      character = {
        success_symbol = "[➜](bold ${selectedTheme.colours.success})";
        error_symbol = "[➜](bold ${selectedTheme.colours.error})";
        vimcmd_symbol = "[❮](bold ${selectedTheme.colours.primary})";
      };

      directory = {
        style = "bold ${selectedTheme.colours.primary}";
        truncation_length = 3;
        truncate_to_repo = true;
      };

      git_branch = {
        symbol = " ";
        style = "bold ${selectedTheme.colours.secondary}";
      };

      git_status = {
        style = "${selectedTheme.colours.warning}";
        conflicted = "🏳";
        ahead = "⇡\${count}";
        behind = "⇣\${count}";
        diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
        up_to_date = "";
        untracked = "?\${count}";
        stashed = "$";
        modified = "!\${count}";
        staged = "+\${count}";
        renamed = "»\${count}";
        deleted = "✘\${count}";
      };

      rust = {
        symbol = " ";
        style = "bold ${selectedTheme.colours.tertiary}";
      };

      python = {
        symbol = " ";
        style = "bold ${selectedTheme.colours.info}";
      };

      nix_shell = {
        symbol = " ";
        style = "bold ${selectedTheme.colours.primary}";
      };

      nodejs = {
        symbol = " ";
        style = "bold ${selectedTheme.colours.success}";
      };

      package = {
        symbol = "📦 ";
        style = "bold ${selectedTheme.colours.fgAlt}";
      };

      cmd_duration = {
        min_time = 500;
        format = "took [$duration](bold ${selectedTheme.colours.warning})";
      };

      time = {
        disabled = false;
        format = "🕙 [$time](bold ${selectedTheme.colours.fgAlt})";
        time_format = "%T";
      };

      username = {
        style_user = "bold ${selectedTheme.colours.primary}";
        style_root = "bold ${selectedTheme.colours.error}";
        format = "[$user]($style) ";
        disabled = false;
      };

      hostname = {
        ssh_only = false;
        format = "on [$hostname](bold ${selectedTheme.colours.secondary}) ";
        disabled = false;
      };
    };
  };
}
