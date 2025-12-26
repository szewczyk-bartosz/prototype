{ selectedTheme, ... }:
let
  workspaces = builtins.genList (x: x) 10;
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
      ];
      ++ (map (i: "SUPER, ${toString i}, workspace, ${toString i}") workspaces)
      ++ (map (i: "SUPER SHIFT, ${toString i}, movetoworkspace, ${toString i}") workspaces);
      general = {
        "$mainMod" = "ALT";
        "col.active_border" = "rgb(${builtins.substring 1 (-1) selectedTheme.colours.primary})";
        "col.inactive_border" = "rgb(${builtins.substring 1 (-1) selectedTheme.colours.secondary})";
      };
    };
  };

}
