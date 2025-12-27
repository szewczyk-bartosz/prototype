{ config, pkgs, ... }:

{
  # Set zsh as the default shell
  home.sessionVariables = {
    SHELL = "${pkgs.zsh}/bin/zsh";
    NIX_BUILD_SHELL = "${pkgs.zsh}/bin/zsh";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    shellAliases = {
      ll = "ls -lah";
      la = "ls -A";
      l = "ls -CF";
      ".." = "cd ..";
      "..." = "cd ../..";
      vim = "nvim";
      vi = "nvim";
      cat = "bat";
      ls = "eza --icons";
      tree = "eza --tree --icons";
    };

    initExtra = ''
      # Enable vi mode
      bindkey -v

      # Better history search
      bindkey '^R' history-incremental-search-backward

      # Case-insensitive completion
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

      # Disable underlining in syntax highlighting
      typeset -A ZSH_HIGHLIGHT_STYLES
      ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'
      ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=cyan'
      ZSH_HIGHLIGHT_STYLES[precommand]='fg=green'
      ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=cyan'
    '';
  };

  # Additional shell tools
  home.packages = with pkgs; [
    eza      # Modern ls replacement
    bat      # Modern cat replacement
    fzf      # Fuzzy finder
    ripgrep  # Fast grep
    fd       # Fast find
    zoxide   # Smart cd
  ];

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.bat = {
    enable = true;
    config = {
      theme = "base16";
    };
  };
}
