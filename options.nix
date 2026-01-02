lib: {
  mikoshiOptions = {
    theme = lib.mkOption {
      default = "akasara";
      type = lib.types.str;
      description = "the theme that Mikoshi will use";
    };

    nvimTheme = lib.mkOption {
      default = null;
      type = lib.types.nullOr lib.types.str;
      description = "neovim colorscheme preset (null = use system theme, string = use preset like 'tokyonight')";
    };

    monitor = lib.mkOption {
      default = ",preferred,auto,auto";
      type = lib.types.str;
      description = "Hyprland monitor configuration (format: 'name,resolution,position,scale')";
    };

    keyboardLayout = lib.mkOption {
      default = "gb";
      type = lib.types.str;
      description = "Keyboard layout (e.g., 'us', 'gb', 'de')";
    };

    git = {
      userName = lib.mkOption {
        type = lib.types.str;
        description = "Git user name (required)";
      };

      userEmail = lib.mkOption {
        type = lib.types.str;
        description = "Git user email (required)";
      };
    };
  };
}
