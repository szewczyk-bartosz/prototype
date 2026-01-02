{ config, pkgs, ... }:
let
  workspaces = builtins.genList (x: x) 10;
  themes = import ../../themes;
  selectedTheme = themes.${config.mikoshi.theme};
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      input =
        {
          "kb_layout" = "gb";
        };
      bind = [
        "$mainMod, Return, exec, kitty"
        "$mainMod SHIFT, Q, killactive"
        "$mainMod SHIFT, O, exit"
        "$mainMod, H, movefocus, l"
        "$mainMod, J, movefocus, d"
        "$mainMod, K, movefocus, u"
        "$mainMod, L, movefocus, r"
        "$mainMod SHIFT, H, movewindow, l"

        "$mainMod SHIFT, K, movewindow, u"
        "$mainMod SHIFT, L, movewindow, r"
        "$mainMod, F, fullscreen"
        "$mainMod, V, togglefloating"
        # launcher
        "$mainMod, Space, exec, wofi --show drun"
        # file explorer
        "$mainMod, E, exec, thunar"
        # lock screen
        "SUPER, L, exec, hyprlock"
        # reload config
        "$mainMod SHIFT, R, exec, hyprctl reload"
        # screenshot
        "$mainMod SHIFT, S, exec, grimblast copy area"
        # clipboard manager
        "$mainMod, C, exec, copyq toggle"
        # Universal clipboard (Super+C/V like Omarchy)
        "SUPER, C, sendshortcut, CTRL, Insert"
        "SUPER, V, sendshortcut, SHIFT, Insert"
      ]
      ++ (map (i: "$mainMod, ${toString i}, workspace, ${toString i}") workspaces)
      ++ (map (i: "$mainMod SHIFT, ${toString i}, movetoworkspace, ${toString i}") workspaces);

      # Volume and brightness binds
      bindel = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ && notify-send -h string:x-canonical-private-synchronous:volume \"Volume: $(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2*100)}')%\""
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && notify-send -h string:x-canonical-private-synchronous:volume \"Volume: $(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2*100)}')%\""
      ];

      bindl = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && notify-send -h string:x-canonical-private-synchronous:volume \"$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q MUTED && echo 'Muted' || echo 'Unmuted')\""
      ];

      general = {
        "$mainMod" = "ALT";
        "col.active_border" = "rgb(${builtins.substring 1 (-1) selectedTheme.colours.primary})";
        "col.inactive_border" = "rgb(${builtins.substring 1 (-1) selectedTheme.colours.secondary})";
        "exec-once" = "waybar";
      };

      misc = {
        # Set background color to match theme (prevents flash on startup)
        background_color = "rgb(${builtins.substring 1 (-1) selectedTheme.colours.bg})";
        force_default_wallpaper = 0; # Disable Hyprland's default anime wallpaper
      };

      # Animations
      animation = [
        "windows, 1, 4, default, popin 80%"
        "windowsOut, 1, 4, default, popin 80%"
        "border, 1, 10, default"
        "borderangle, 1, 8, default"
        "fade, 1, 7, default"
        "workspaces, 1, 5, default, fade"
      ];

      bezier = [
        "default, 0.05, 0.9, 0.1, 1.0"
      ];

      # Window rules
      windowrulev2 = [
        # Float network manager connection editor
        "float, class:^(nm-connection-editor)$"
        "size 800 600, class:^(nm-connection-editor)$"
        "center, class:^(nm-connection-editor)$"
      ];

      # Monitor configuration
      monitor = config.mikoshi.monitor;
    };
  };

  # Install audio control tools
  home.packages = with pkgs; [
    wireplumber # For wpctl
  ];
}
