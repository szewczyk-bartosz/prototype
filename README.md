For now, the README is just so I can lay out the design


# Core Philosophy
- Works out of the box
- Keyboard first
- Coherent themes
- Complete
- Clear to user
- Minimal nix knowledge required

# TODO Checklist

## Core System Setup

### Flake Structure
- [ ] Create `flake.nix` with proper inputs (nixpkgs, home-manager)
- [ ] Define `nixosModules.default` output
- [ ] Define `homeManagerModules.default` output
- [ ] Set up proper module imports
- [ ] Configure flake-utils for multi-system support

### Module Architecture
- [ ] Create `modules/nixos/` directory structure
- [ ] Create `modules/home/` directory structure
- [ ] Create `modules/nixos/default.nix` that imports all system modules
- [ ] Create `modules/home/default.nix` that imports all home modules
- [ ] Define `mikoshi` option namespace
- [ ] Create options for username, hostname, theme

## Window Manager & Desktop Environment

### Hyprland Configuration
- [ ] Enable Hyprland in NixOS module
- [ ] Create Hyprland home-manager configuration
- [ ] Configure default keybindings
- [ ] Set up window rules
- [ ] Configure workspace behavior (10 workspaces)
- [ ] Set up gaps and borders
- [ ] Configure animations
- [ ] Enable multi-monitor support
- [ ] Make configuration themeable

### Waybar
- [ ] Install and enable Waybar
- [ ] Create base Waybar configuration
- [ ] Configure workspace module
- [ ] Configure network module (with nm-applet integration)
- [ ] Configure audio module (with pavucontrol integration)
- [ ] Configure battery module (with power profile switching)
- [ ] Configure Bluetooth module (with blueman integration)
- [ ] Configure clock/date module
- [ ] Add custom CSS for animations
- [ ] Make fully themeable
- [ ] Add pre-rendered animated icons support

### Window Switcher
- [ ] Install Hyprshell
- [ ] Configure Alt+Tab behavior
- [ ] Theme to match system theme

### Application Launcher
- [ ] Install Wofi
- [ ] Create base configuration
- [ ] Configure keybinding (Super+Space)
- [ ] Make themeable
- [ ] Add custom CSS styling

### Notifications
- [ ] Install Mako
- [ ] Create base configuration
- [ ] Configure notification timeout
- [ ] Set up notification actions
- [ ] Make themeable
- [ ] Configure urgency levels

### Lock Screen
- [ ] Install Hyprlock
- [ ] Create base configuration
- [ ] Add custom animations
- [ ] Make themeable
- [ ] Configure auto-lock timeout
- [ ] Set up lock on lid close (laptops)

### Wallpapers
- [ ] Install swww
- [ ] Create wallpaper management system
- [ ] Add smooth transition effects
- [ ] Make per-theme wallpapers
- [ ] Add wallpaper directory structure

### Screenshots
- [ ] Install Grimblast (+ grim, slurp dependencies)
- [ ] Configure screenshot keybindings
- [ ] Set up clipboard integration
- [ ] Create screenshot directory
- [ ] Add notification on screenshot

### Display Manager (SDDM)
- [ ] Enable SDDM in NixOS module
- [ ] Install SDDM theme dependencies
- [ ] Create custom cyberpunk theme
- [ ] Add QML animations
- [ ] Make theme match system theme
- [ ] Configure auto-login option

## Terminal & Shell

### Kitty
- [ ] Install Kitty
- [ ] Create base configuration
- [ ] Configure keybindings (Ctrl+C/V support)
- [ ] Make themeable
- [ ] Configure font settings
- [ ] Enable ligatures

### Zsh
- [ ] Install and set Zsh as default shell
- [ ] Configure basic Zsh settings
- [ ] Enable command history
- [ ] Set up auto-suggestions
- [ ] Set up syntax highlighting
- [ ] Configure completion system

### Starship
- [ ] Install Starship
- [ ] Create base configuration
- [ ] Make themeable
- [ ] Configure relevant modules (git, nix, etc.)

### CLI Tools
- [ ] Install eza (ls replacement)
- [ ] Install bat (cat replacement)
- [ ] Install ripgrep
- [ ] Install fd
- [ ] Install zoxide
- [ ] Install fzf
- [ ] Install btop
- [ ] Install dust
- [ ] Configure shell aliases for modern tools

## File Management

### Thunar
- [ ] Install Thunar
- [ ] Configure default file associations
- [ ] Make themeable (GTK)
- [ ] Set up thumbnail generation
- [ ] Configure keybinding (Super+E)

### Yazi
- [ ] Install Yazi
- [ ] Create base configuration
- [ ] Make themeable
- [ ] Configure keybindings
- [ ] Set up image previews

## Applications

### Web Browsers
- [ ] Install Brave
- [ ] Install qutebrowser
- [ ] Configure qutebrowser base settings
- [ ] Make qutebrowser themeable

### Media Applications
- [ ] Install Zathura (PDF)
- [ ] Configure Zathura settings
- [ ] Make Zathura themeable
- [ ] Install imv (images)
- [ ] Install VLC
- [ ] Create custom music player (TUI)

### Productivity
- [ ] Install KeePassXC
- [ ] Configure KeePassXC integration
- [ ] Install Obsidian

### Graphics & Recording
- [ ] Install GIMP
- [ ] Install OBS Studio
- [ ] Configure OBS basic settings

### System Tools
- [ ] Install p7zip, unzip, unrar
- [ ] Install CopyQ
- [ ] Configure CopyQ settings
- [ ] Make CopyQ themeable
- [ ] Set up CopyQ keybindings
- [ ] Install hyprpicker
- [ ] Configure hyprpicker keybinding

## Development Environment

### NixVim
- [ ] Set up NixVim flake input
- [ ] Create base NixVim configuration
- [ ] Configure LSP for Rust (rust-analyzer)
- [ ] Configure LSP for Python (pyright)
- [ ] Set up Tree-sitter
- [ ] Configure Telescope (fuzzy finder)
- [ ] Set up file explorer (Neo-tree or nvim-tree)
- [ ] Configure Git integration (Gitsigns, Fugitive)
- [ ] Set up auto-completion (nvim-cmp)
- [ ] Configure snippets
- [ ] Make themeable
- [ ] Set up custom keybindings
- [ ] Configure cyberpunk aesthetic

### Languages & Tools
- [ ] Install Rust toolchain
- [ ] Install Python
- [ ] Install pip
- [ ] Configure direnv
- [ ] Configure nix-direnv

### Git
- [ ] Install Git
- [ ] Create sensible gitconfig defaults
- [ ] Install Delta (diff viewer)
- [ ] Install Lazygit
- [ ] Configure Lazygit theme

### Debugging
- [ ] Install GDB
- [ ] Install LLDB

## Theme System

### Theme Infrastructure
- [ ] Create theme definition structure
- [ ] Create theme option in mikoshi namespace
- [ ] Set up color palette system
- [ ] Create theme validation
- [ ] Set up theme propagation to all components

### Theme Definitions
- [ ] Create Arasaka theme (custom cyberpunk)
- [ ] Create Tokyo Night theme
- [ ] Create Catppuccin Mocha theme
- [ ] Create Catppuccin Latte theme
- [ ] Create Gruvbox theme
- [ ] Create Nord theme
- [ ] Create Everforest theme

### Theme Application
- [ ] Apply theme to Hyprland (borders, colors, gaps)
- [ ] Apply theme to Waybar
- [ ] Apply theme to Kitty
- [ ] Apply theme to Wofi
- [ ] Apply theme to Mako
- [ ] Apply theme to Hyprlock
- [ ] Apply theme to SDDM
- [ ] Apply theme to NixVim
- [ ] Apply theme to Thunar (GTK)
- [ ] Apply theme to Yazi
- [ ] Apply theme to Qt applications
- [ ] Apply theme to wallpaper selection
- [ ] Apply theme to cursor
- [ ] Apply theme to icons
- [ ] Apply theme to Zathura
- [ ] Apply theme to qutebrowser

## System Services

### Audio
- [ ] Enable PipeWire in NixOS module
- [ ] Enable WirePlumber
- [ ] Install pavucontrol
- [ ] Configure audio hotkeys
- [ ] Set up volume popup notifications

### Bluetooth
- [ ] Enable BlueZ in NixOS module
- [ ] Install blueman
- [ ] Configure blueman-applet
- [ ] Set up Bluetooth audio support

### Networking
- [ ] Enable NetworkManager in NixOS module
- [ ] Install nm-applet
- [ ] Configure WiFi support
- [ ] Set up VPN plugin support (OpenVPN, WireGuard)

### Power Management
- [ ] Enable TLP for laptops (conditional)
- [ ] Configure battery optimization
- [ ] Set up CPU frequency scaling
- [ ] Configure lid close behavior
- [ ] Set up auto-sleep on idle
- [ ] Configure screen timeout
- [ ] Set up brightness controls
- [ ] Add brightness popup notifications

### Fonts
- [ ] Install Nerd Fonts
- [ ] Install JetBrainsMono Nerd Font
- [ ] Install Inter font
- [ ] Install Noto fonts (all variants)
- [ ] Install Noto Color Emoji
- [ ] Install Noto CJK fonts
- [ ] Configure font rendering (FreeType)

### Hardware Support
- [ ] Configure Intel graphics (auto-detect)
- [ ] Configure AMD graphics with Vulkan
- [ ] Create NVIDIA module (optional, user-enabled)
- [ ] Configure libinput for touchpad
- [ ] Enable touchpad gestures
- [ ] Set up natural scrolling
- [ ] Enable tap-to-click
- [ ] Configure multi-monitor support
- [ ] Set up HiDPI support
- [ ] Create optional CUPS module for printing

## Keybindings

### Window Management
- [ ] Configure Ctrl+C/V universal clipboard
- [ ] Set up Super+HJKL window focus
- [ ] Set up Super+Shift+HJKL window movement
- [ ] Configure Super+Q close window
- [ ] Configure Super+F fullscreen toggle
- [ ] Configure Super+V floating toggle

### Workspaces
- [ ] Set up Super+[1-9] workspace switching
- [ ] Set up Super+Shift+[1-9] move to workspace
- [ ] Configure Super+Tab window switcher

### Launchers
- [ ] Configure Super+Return terminal
- [ ] Configure Super+Space launcher
- [ ] Configure Super+Shift+S screenshot
- [ ] Configure Super+L lock screen
- [ ] Configure Super+E file manager

### System
- [ ] Configure Super+Shift+E logout menu
- [ ] Configure Super+Shift+R reload config

### Media
- [ ] Configure volume up/down keys with popup
- [ ] Configure brightness up/down keys with popup

### Theme
- [ ] Configure Super+Ctrl+T theme switcher

## User Experience

### Configuration
- [ ] Document all mikoshi options
- [ ] Create example configuration
- [ ] Set up sensible defaults for all options
- [ ] Create override system for power users

### Updates
- [ ] Document update process
- [ ] Test flake update workflow
- [ ] Ensure updates don't break user configs

### Documentation
- [ ] Write installation guide
- [ ] Create keybindings cheat sheet
- [ ] Document theme switching process
- [ ] Write customization guide
- [ ] Create troubleshooting section
- [ ] Document all mikoshi options

## Testing & Quality

### Testing
- [ ] Test on fresh NixOS install
- [ ] Test all keybindings
- [ ] Test theme switching
- [ ] Test on multiple hardware configs
- [ ] Test laptop-specific features
- [ ] Test multi-monitor setups

### Polish
- [ ] Ensure all animations work smoothly
- [ ] Verify theme coherence across all apps
- [ ] Test clipboard manager reliability
- [ ] Verify all GUI tools are accessible
- [ ] Check performance optimization

==========


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


# Themes

!!REQ!!

**Theme System:**
- Edit theme in your config file, rebuild to apply
- All theme configs generated from single source

**Theme Switching:**
```nix
# In your configuration:
theme = "arasaka";  # Change this line

# Then rebuild:
sudo nixos-rebuild switch --flake .#yourhostname  # System config
home-manager switch --flake .#youruser           # User config
```

**Included Themes:**
- Akasara - Totally not Arasaka Theme

**Themed Components:**
- Window manager (Hyprland borders, gaps, colors)
- Status bar (Waybar)
- Terminal (Kitty)
- Application launcher (Wofi)
- Notification daemon (Mako)
- Lock screen (Hyprlock)
- Login screen (SDDM)
- Text editor (NixVim)
- File managers (Thunar, Yazi)
- GTK applications
- Qt applications
- Wallpaper
- Cursor theme
- Icon theme

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

# Applications

!!REQ!!

**Web Browsers:**
- Brave - Privacy-focused, Chromium-based
- qutebrowser - Keyboard-driven, minimal

**Media:**
- Zathura - PDF viewer (keyboard-driven)
- imv - Image viewer
- VLC - Video player
- Custom music player - TUI-based (to be developed)

**Productivity:**
- KeePassXC - Password manager (local, no cloud)
- Obsidian - Note-taking and knowledge management

**Graphics & Recording:**
- GIMP - Image editing
- OBS Studio - Screen recording and streaming

**System Tools:**
- Archive tools - p7zip, unzip, unrar (CLI only)
- CopyQ - Clipboard manager (with encryption support)
- hyprpicker - Color picker

!!REQ!!


# Development Tools

!!REQ!!

**Languages & Toolchains:**
- Nix/NixOS tooling (built-in)
- Rust (rustc, cargo, rust-analyzer)
- Python (python3, pip, pyright LSP)

**Version Management:**
- direnv - Auto-load project environments
- nix-direnv - Faster direnv for Nix projects

**Editor (NixVim):**
- Pre-configured Neovim via NixVim
- LSP support for Rust and Python
- Tree-sitter syntax highlighting
- Fuzzy finding (Telescope)
- File explorer (Neo-tree or nvim-tree)
- Git integration (Gitsigns, Fugitive)
- Auto-completion (nvim-cmp)
- Snippets
- Cyberpunk-themed (matches system theme)

**Git Configuration:**
- Sensible defaults
- Delta (better git diff)
- Lazygit (TUI git interface)

**Debugging:**
- GDB
- LLDB

!!REQ!!


# Audio & Bluetooth

!!REQ!!

**Audio System:**
- PipeWire - Modern audio server (replaces PulseAudio/JACK)
- WirePlumber - PipeWire session manager
- pavucontrol - GUI volume control and audio device management
- Audio controls via media keys with on-screen popup

**Bluetooth:**
- BlueZ - Bluetooth stack
- blueman - GUI Bluetooth manager (system tray applet)
- Bluetooth audio support (A2DP profiles)
- Easy pairing and device management via GUI

**Waybar Integration:**
- Audio module showing volume level
- Click to open pavucontrol
- Bluetooth module showing connection status
- Click to open blueman

!!REQ!!


# Networking

!!REQ!!

**Network Management:**
- NetworkManager - Network connection management
- nm-applet - System tray network applet
- GUI WiFi connection and management
- Ethernet auto-configuration

**Waybar Integration:**
- Network module showing connection status
- WiFi signal strength indicator
- Click to open network menu
- Easy WiFi switching via mouse

**VPN Support:**
- NetworkManager VPN plugins
- OpenVPN support
- WireGuard support

!!REQ!!

# Fonts

!!REQ!!

**System Fonts:**
- Nerd Fonts - Icons and glyphs for terminal/waybar
- JetBrainsMono Nerd Font - Default monospace
- Inter - Default sans-serif
- Noto fonts - Comprehensive Unicode coverage

**Special Support:**
- Emoji fonts (Noto Color Emoji)
- Japanese/Chinese/Korean fonts (Noto CJK)
- Font rendering optimization (FreeType)

**Theme Integration:**
- Fonts automatically themed across all applications
- Consistent sizing and rendering

!!REQ!!

# Power Management

!!REQ!!

**Laptop Support:**
- TLP - Advanced power management
- Battery optimization profiles
- CPU frequency scaling
- Auto-sleep on lid close

**Waybar Integration:**
- Battery module with percentage and status
- Charging indicator
- Time remaining estimate
- Power profile switcher (click to change)

**Screen & Sleep:**
- Auto-screen timeout (configurable)
- Automatic suspend on idle
- Lock on lid close
- Wake on keyboard/mouse

**Brightness Control:**
- Brightness keys with on-screen popup
- Automatic brightness (optional)
- Night light/blue light filter (Hyprsunset/Gammastep)

!!REQ!!

# Hardware Support

!!REQ!!

**Graphics Drivers:**
- Intel - Automatic detection and configuration
- AMD - AMDGPU drivers with Vulkan support
- NVIDIA - Optional module (user enables if needed)

**Input Devices:**
- libinput - Touchpad and mouse configuration
- Touchpad gestures (multi-touch support)
- Natural scrolling (configurable)
- Tap-to-click enabled by default

**Monitor Support:**
- Multi-monitor detection
- Automatic DPI scaling
- HiDPI support (configurable per monitor)
- Display configuration via Hyprland

**Printing:**
- CUPS - Printing system (optional module)
- Network printer discovery

!!REQ!!
