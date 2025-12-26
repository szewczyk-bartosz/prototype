For now, the README is just so I can lay out the design


# Core Philosophy
- Works out of the box
- Keyboard first
- Coherent themes
- Complete
- Clear to user
- Minimal nix knowledge required

# Installation
Installation needs to be one command only from a nixos ISO !REQ!
Swapping existing nixOS to Mikoshi should be easy !REQ!

# Core components
!!REQ!!
Compositor: Hyprland
Window Switcher: Hyprshell
Status Bar: Waybar
Launcher: Wofi
Notifications: Mako
Lock Screen: Hyprlock
Wallpapers: swww
Screenshots: Grimblast
Display Manager: SDDM
Terminal Emulator: Kitty
File Viewer GUI: Thunar
File Viewer TUI: Yazi
Editor: NixVim
!!REQ!!

# Theming 
Themes are an important thing in this system and need to be instantenous to apply and easy to swap / edit 

!!REQ!!
Themes need to be applied to the following automatically:
 Window manager (Hyprland borders, gaps, colors)
 Status bar (Waybar)
 Terminal (Kitty/Alacritty)
 Application launcher (Rofi/Wofi)
 Notification daemon (Mako/Dunst)
 Lock screen (Hyprlock/Swaylock)
 Text editor (Neovim/Helix)
 File manager
 GTK applications
 Qt applications
 Wallpaper
 Cursor theme
 Icon theme
!!REQ!!

# Keybindings

!!REQ!!

**Universal Clipboard:**
- `Ctrl + C` / `Ctrl + V` - Copy/Paste everywhere (terminal included)

**Window Management:**
- `Super + H/J/K/L` - Move focus between windows (Vim-style)
- `Super + Shift + H/J/K/L` - Move windows around
- `Super + Q` - Close window
- `Super + F` - Toggle fullscreen
- `Super + V` - Toggle floating mode

**Workspaces:**
- `Super + [1-9]` - Switch to workspace
- `Super + Shift + [1-9]` - Move window to workspace
- `Super + Tab` - Switch between recent windows (Hyprshell)

**Launchers & Tools:**
- `Super + Return` - Launch terminal
- `Super + Space` - Application launcher
- `Super + Shift + S` - Screenshot
- `Super + L` - Lock screen
- `Super + E` - File manager

**System:**
- `Super + Shift + E` - Exit/logout menu
- `Super + Shift + R` - Reload Hyprland config

**Volume & Brightness:**
- `XF86AudioRaiseVolume/LowerVolume` - Volume control (with popup)
- `XF86MonBrightnessUp/Down` - Brightness control (with popup)

**Theme:**
- `Super + Ctrl + T` - Theme switcher menu

!!REQ!!


# Shell & CLI Tools

!!REQ!!

**Shell:**
- Zsh with Starship prompt
- Syntax highlighting
- Auto-suggestions
- Command history search

**Modern CLI Replacements:**
- `eza` - Better `ls` (colors, icons, git integration)
- `bat` - Better `cat` (syntax highlighting)
- `ripgrep (rg)` - Better `grep` (faster searching)
- `fd` - Better `find` (simpler syntax)
- `zoxide` - Smart `cd` (learns your habits)
- `fzf` - Fuzzy finder (search everything)

**System Monitoring:**
- `btop` - Resource monitor (CPU, RAM, processes)
- `dust` - Disk usage analyzer

**Development:**
- `git` with sensible defaults
- `direnv` - Auto-load project environments
- Language servers for common languages

!!REQ!!
