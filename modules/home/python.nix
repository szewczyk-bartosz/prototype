{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Python 3 with common development tools
    python312
    python312Packages.pip
    python312Packages.virtualenv

    # Python tooling
    poetry          # Dependency management
    ruff            # Fast Python linter/formatter

    # Useful for building Python packages
    gcc
    gnumake
  ];

  # Set up Python environment
  home.sessionVariables = {
    # Allow pip to install packages to user directory
    PIP_USER = "1";
  };

  home.sessionPath = [
    "$HOME/.local/bin"  # Where pip installs user packages
  ];
}
