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
        height = 24;
        spacing = 0;
        margin = "0";

        modules-left = [
          "hyprland/workspaces"
          "custom/separator"
        ];
        modules-center = [ "custom/grid-status" ];
        modules-right = [
          "custom/separator"
          "network"
          "custom/separator"
          "clock"
          "custom/separator"
          "pulseaudio"
          "custom/separator"
          "battery"
          "custom/separator"
          "temperature"
          "custom/separator"
        ];

        "hyprland/workspaces" = {
          format = "{name}";
          on-click = "activate";
          sort-by-number = true;
          persistent-workspaces = {
            "*" = [ 1 2 3 4 ];
          };
        };

        "custom/separator" = {
          format = "//";
          interval = "once";
          tooltip = false;
        };

        "custom/grid-status" = {
          format = "CONNECTED TO GRID";
          interval = "once";
          tooltip = false;
        };

        "custom/updates" = {
          format = " ";
          interval = 3600;
          tooltip = false;
        };

        clock = {
          format = "{:%H:%M:%S}";
          interval = 1;
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
          format = " {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          tooltip = false;
        };

        network = {
          format-wifi = " ";
          format-ethernet = " ";
          format-disconnected = "⚠";
          tooltip-format = "{ifname}: {ipaddr}";
          tooltip-format-wifi = "{essid} ({signalStrength}%)";
          on-click = "nm-connection-editor";
        };

        pulseaudio = {
          format = "{icon}";
          format-muted = "";
          format-icons = {
            default = [ "" "" "" ];
          };
          on-click = "pavucontrol";
          tooltip = false;
        };

        temperature = {
          critical-threshold = 80;
          format = " {temperatureC}°C";
          tooltip = false;
        };

        tray = {
          spacing = 8;
        };
      };
    };

    style = ''
      * {
        font-family: "3270 Nerd Font";
        font-size: 12px;
        min-height: 0;
        font-weight: bold;
      }

      window#waybar {
        background: ${selectedTheme.colours.bg};
        color: ${selectedTheme.colours.fg};
        border-bottom: 2px solid ${selectedTheme.colours.primary};
      }

      /* Workspaces */
      #workspaces {
        margin: 0;
        padding: 0;
      }

      #workspaces button {
        padding: 0 10px;
        background: transparent;
        color: ${selectedTheme.colours.fg};
        border: none;
        border-radius: 0;
        margin: 0 2px;
      }

      #workspaces button:hover {
        background: ${selectedTheme.colours.hover};
        color: ${selectedTheme.colours.fg};
      }

      #workspaces button.active {
        background: ${selectedTheme.colours.primary};
        color: ${selectedTheme.colours.bg};
        box-shadow: 0 0 10px ${selectedTheme.colours.primary},
                    0 0 20px ${selectedTheme.colours.primary},
                    0 0 30px ${selectedTheme.colours.primary};
      }

      #workspaces button.urgent {
        background: ${selectedTheme.colours.error};
        color: ${selectedTheme.colours.bg};
      }

      /* Separator */
      #custom-separator {
        color: ${selectedTheme.colours.secondary};
        padding: 0 8px;
        margin: 0;
      }

      /* Grid status */
      #custom-grid-status {
        color: ${selectedTheme.colours.secondary};
        font-weight: bold;
        padding: 0 12px;
      }

      /* All modules */
      #clock,
      #battery,
      #network,
      #pulseaudio,
      #temperature,
      #custom-updates,
      #tray {
        padding: 0 8px;
        background: transparent;
        color: ${selectedTheme.colours.fg};
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

      #temperature.critical {
        color: ${selectedTheme.colours.error};
      }
    '';
  };
}
