{ config, ... }:
let
  themes = import ../../themes;
  selectedTheme = themes.${config.mikoshi.theme};
in
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 34;
        spacing = 4;
        
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "network" "battery" "tray" ];
        
        "hyprland/workspaces" = {
          format = "{name}";
          on-click = "activate";
          sort-by-number = true;
        };
        
        clock = {
          format = "{:%H:%M}";
          format-alt = "{:%A, %B %d, %Y (%H:%M)}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            format = {
              months = "<span color='${selectedTheme.colours.primary}'><b>{}</b></span>";
              days = "<span color='${selectedTheme.colours.fg}'><b>{}</b></span>";
              weeks = "<span color='${selectedTheme.colours.secondary}'><b>W{}</b></span>";
              weekdays = "<span color='${selectedTheme.colours.tertiary}'><b>{}</b></span>";
              today = "<span color='${selectedTheme.colours.error}'><b><u>{}</u></b></span>";
            };
          };
        };
        
        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{icon} {time}";
          format-icons = [ "" "" "" "" "" ];
        };
        
        network = {
          format-wifi = " {signalStrength}%";
          format-ethernet = " {ipaddr}";
          format-linked = " {ifname} (No IP)";
          format-disconnected = "⚠ Disconnected";
          tooltip-format = "{ifname} via {gwaddr}";
          tooltip-format-wifi = " {essid} ({signalStrength}%)";
          on-click = "nm-connection-editor";
        };
        
        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = " Muted";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" "" ];
          };
          on-click = "pavucontrol";
        };
        
        tray = {
          spacing = 10;
        };
      };
    };
    
    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 13px;
        min-height: 0;
      }
      
      window#waybar {
        background: ${selectedTheme.colours.bg};
        color: ${selectedTheme.colours.fg};
        border-bottom: 2px solid ${selectedTheme.colours.primary};
      }
      
      #workspaces button {
        padding: 0 8px;
        background: transparent;
        color: ${selectedTheme.colours.fgAlt};
        border: none;
        border-radius: 0;
      }
      
      #workspaces button:hover {
        background: ${selectedTheme.colours.bgAlt};
        color: ${selectedTheme.colours.fg};
      }
      
      #workspaces button.active {
        background: ${selectedTheme.colours.primary};
        color: ${selectedTheme.colours.bg};
      }
      
      #workspaces button.urgent {
        background: ${selectedTheme.colours.error};
        color: ${selectedTheme.colours.bg};
      }
      
      #clock,
      #battery,
      #network,
      #pulseaudio,
      #tray {
        padding: 0 10px;
        background: ${selectedTheme.colours.bgAlt};
        margin: 4px 2px;
        border-radius: 4px;
      }
      
      #battery.charging {
        color: ${selectedTheme.colours.success};
      }
      
      #battery.warning:not(.charging) {
        color: ${selectedTheme.colours.warning};
      }
      
      #battery.critical:not(.charging) {
        color: ${selectedTheme.colours.error};
        animation: blink 1s linear infinite;
      }
      
      @keyframes blink {
        to {
          color: ${selectedTheme.colours.bg};
        }
      }
      
      #network.disconnected {
        color: ${selectedTheme.colours.error};
      }
      
      #pulseaudio.muted {
        color: ${selectedTheme.colours.fgAlt};
      }
    '';
  };
}
