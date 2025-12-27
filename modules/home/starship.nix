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
      # Cyberpunk custom format
      format = "[╭─](bold ${selectedTheme.colours.primary})[\\[](${selectedTheme.colours.secondary})$username$hostname[\\]](${selectedTheme.colours.secondary})[ ─\\[](bold ${selectedTheme.colours.primary})$directory[\\]](${selectedTheme.colours.secondary})$git_branch$git_status$rust$python$nix_shell$nodejs$cmd_duration[ ─\\[](bold ${selectedTheme.colours.primary})$time[\\]](${selectedTheme.colours.secondary})\n[╰─](bold ${selectedTheme.colours.primary})$character";

      add_newline = true;

      character = {
        success_symbol = "[▸](bold ${selectedTheme.colours.secondary})";
        error_symbol = "[▸](bold ${selectedTheme.colours.error})";
        vimcmd_symbol = "[◂](bold ${selectedTheme.colours.primary})";
      };

      directory = {
        style = "bold ${selectedTheme.colours.primary}";
        truncation_length = 3;
        truncate_to_repo = true;
        format = "[$path]($style)[$read_only]($read_only_style)";
        read_only = " ";
        read_only_style = "${selectedTheme.colours.error}";
      };

      git_branch = {
        symbol = " ";
        style = "bold ${selectedTheme.colours.secondary}";
        format = "[ ─\\[](bold ${selectedTheme.colours.primary})[$symbol$branch]($style)[\\]](${selectedTheme.colours.secondary})";
      };

      git_status = {
        style = "${selectedTheme.colours.warning}";
        format = "[\\[](${selectedTheme.colours.secondary})[$all_status$ahead_behind]($style)[\\]](${selectedTheme.colours.secondary})";
        conflicted = "═";
        ahead = "⇡\${count}";
        behind = "⇣\${count}";
        diverged = "⇕\${ahead_count}⇣\${behind_count}";
        up_to_date = "";
        untracked = "?\${count}";
        stashed = "\${count}";
        modified = "!\${count}";
        staged = "+\${count}";
        renamed = "»\${count}";
        deleted = "✘\${count}";
      };

      rust = {
        symbol = "  ";
        style = "bold ${selectedTheme.colours.tertiary}";
        format = "[ ─\\[](bold ${selectedTheme.colours.primary})[$symbol($version)]($style)[\\]](${selectedTheme.colours.secondary})";
      };

      python = {
        symbol = "  ";
        style = "bold ${selectedTheme.colours.secondary}";
        format = "[ ─\\[](bold ${selectedTheme.colours.primary})[$symbol($version)]($style)[\\]](${selectedTheme.colours.secondary})";
      };

      nix_shell = {
        symbol = "  ";
        style = "bold ${selectedTheme.colours.primary}";
        format = "[ ─\\[](bold ${selectedTheme.colours.primary})[$symbol$state]($style)[\\]](${selectedTheme.colours.secondary})";
      };

      nodejs = {
        symbol = "  ";
        style = "bold ${selectedTheme.colours.success}";
        format = "[ ─\\[](bold ${selectedTheme.colours.primary})[$symbol($version)]($style)[\\]](${selectedTheme.colours.secondary})";
      };

      package = {
        symbol = " ";
        style = "bold ${selectedTheme.colours.fgAlt}";
        format = "[ ─\\[](bold ${selectedTheme.colours.primary})[$symbol$version]($style)[\\]](${selectedTheme.colours.secondary})";
      };

      cmd_duration = {
        min_time = 500;
        format = "[ ─\\[](bold ${selectedTheme.colours.primary})[ $duration]($style)[\\]](${selectedTheme.colours.secondary})";
        style = "bold ${selectedTheme.colours.warning}";
      };

      time = {
        disabled = false;
        format = "[$time]($style)";
        style = "bold ${selectedTheme.colours.secondary}";
        time_format = "%H:%M:%S";
      };

      username = {
        style_user = "bold ${selectedTheme.colours.secondary}";
        style_root = "bold ${selectedTheme.colours.error}";
        format = "[$user]($style)";
        disabled = false;
        show_always = true;
      };

      hostname = {
        ssh_only = false;
        format = "[@$hostname]($style)";
        style = "bold ${selectedTheme.colours.secondary}";
        disabled = false;
      };
    };
  };
}
