{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Pre-built Rust toolchain from nixpkgs (instant download)
    cargo
    rustc
    rustfmt
    clippy
    rust-analyzer

    # Additional Rust tools
    cargo-watch      # Auto-rebuild on file changes
    cargo-edit       # cargo add, cargo rm, cargo upgrade
    cargo-outdated   # Check for outdated dependencies
    cargo-audit      # Security vulnerability scanner

    # Build dependencies that Rust projects commonly need
    pkg-config
    openssl
  ];

  # Set up environment for Rust
  home.sessionVariables = {
    # This makes cargo binaries available in PATH
    CARGO_HOME = "$HOME/.cargo";
  };

  home.sessionPath = [
    "$HOME/.cargo/bin"
  ];

  # Cargo configuration
  home.file.".cargo/config.toml".text = ''
    [build]
    jobs = 4  # Parallel compilation jobs

    [term]
    color = "always"
  '';
}
