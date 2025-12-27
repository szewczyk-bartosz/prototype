{ pkgs, ... }:

{
  programs.nixvim = {
    plugins.lsp = {
      enable = true;

      servers = {
        # Rust
        rust_analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
          settings = {
            checkOnSave = {
              command = "clippy";
            };
            cargo = {
              allFeatures = true;
            };
          };
        };

        # Python
        pyright = {
          enable = true;
        };

        # Nix
        nixd = {
          enable = true;
        };

        # C/C++
        clangd = {
          enable = true;
        };
      };
    };

    # Formatter configuration
    plugins.conform-nvim = {
      enable = true;
      settings = {
        formatters_by_ft = {
          rust = [ "rustfmt" ];
          python = [ "black" ];
          nix = [ "nixpkgs_fmt" ];
          c = [ "clang_format" ];
          cpp = [ "clang_format" ];
        };
        format_on_save = {
          timeout_ms = 500;
          lsp_fallback = true;
        };
      };
    };

    # Additional formatter packages
    extraPackages = with pkgs; [
      rustfmt
      black
      nixpkgs-fmt
      clang-tools
    ];
  };
}
