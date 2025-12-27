{ config, ... }:
let
  workspaces = builtins.genList (x: x) 10;
  themes = import ../../themes;
  selectedTheme = themes.${config.mikoshi.theme};
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
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
      ]
      ++ (map (i: "$mainMod, ${toString i}, workspace, ${toString i}") workspaces)
      ++ (map (i: "$mainMod SHIFT, ${toString i}, movetoworkspace, ${toString i}") workspaces);
      general = {
        "$mainMod" = "ALT";
        "col.active_border" = "rgb(${builtins.substring 1 (-1) selectedTheme.colours.primary})";
        "col.inactive_border" = "rgb(${builtins.substring 1 (-1) selectedTheme.colours.secondary})";
        "exec-once" = "waybar";
      };
    };
  };

}
