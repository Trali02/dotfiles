{ pkgs, lib, ... }: {
  programs.waybar = {
    enable = true;
    style = (builtins.readFile ./style.css);
    settings = {
      mainBar = {
        height = 24;
        modules-left = [ "hyprland/workspaces" "hyprland/submap" ];
        modules-center = [ "clock" "mpd" ];
        modules-right =
          [ "cpu" "network" "pulseaudio" "battery" "custom/power" ];
        "hyprland/workspaces" = {
          "format" = "<span>{icon}</span>";
          "on-click" = "activate";
          "format-icons" = {
            "default" = "";
            "active" = "";
          };
          "sort-by-number" = true;
          "persistent-workspaces" = { "*" = 3; };
        };
        "hyprland/submap" = { "format" = "{}"; };

        "mpd" = {
          "format" =
            "  {title} - {artist} {stateIcon} [{elapsedTime:%M:%S}/{totalTime:%M:%S}] {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}[{songPosition}/{queueLength}] [{volume}%]";
          "format-disconnected" = " Disconnected";
          "format-stopped" =
            " {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped";
          "unknown-tag" = "N/A";
          "interval" = 2;
          "consume-icons" = { "on" = " "; };
          "random-icons" = {
            "off" = ''<span color="#f53c3c"></span> '';
            "on" = " ";
          };
          "repeat-icons" = { "on" = " "; };
          "single-icons" = { "on" = "1 "; };
          "state-icons" = {
            "playing" = "";
            "paused" = "";
          };
          "tooltip-format" = "MPD (connected)";
          "tooltip-format-disconnected" = "MPD (disconnected)";
          "on-click" = "mpc toggle";
          "on-scroll-up" = "mpc volume +2";
          "on-scroll-down" = "mpc volume -2";
        };
        "idle_inhibitor" = {
          "format" = "{icon}";
          "format-icons" = {
            "activated" = " ";
            "deactivated" = " ";
          };
        };
        "tray" = { "spacing" = 10; };
        "clock" = { "format" = "{:L%H:%M}"; };
        "cpu" = { "format" = " {usage}%"; };
        "memory" = { "format" = "  {}%"; };
        "temperature" = {
          "thermal-zone" = 2;
          "critical-threshold" = 50;
          "format-critical" = "{icon} {temperatureC}°C";
          "format" = "{icon} {temperatureC}°C";
          "format-icons" = [ "" "" "" ];
        };
        "battery" = {
          "states" = {
            "good" = 90;
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{icon}  {capacity}%";
          "format-charging" = "󰂄 {capacity}%";
          "format-plugged" = " {capacity}%";
          "format-alt" = "{icon}  {time}";
          "format-icons" = [ " " " " " " " " " " ];
        };
        "network" = {
          "format-wifi" = " {signalStrength}%";
          "format-ethernet" = "󰈀 {ifname}";
          "tooltip-format" = "󰈀 {ifname} via {gwaddr}";
          "format-linked" = "!󰈀 {ifname} (No IP)";
          "format-disconnected" = " Disconnected";
          "format-alt" = "󰈀 {ifname}: {ipaddr}/{cidr}";
        };
        "pulseaudio" = {
          "scroll-step" = 5;
          "format" = "{icon} {volume}% {format_source}";
          "format-bluetooth" = " {icon} {volume}% {format_source}";
          "format-bluetooth-muted" = "  {icon} {format_source}";
          "format-muted" = "  {format_source}";
          "format-source" = " {volume}%";
          "format-source-muted" = "󰍭 ";
          "format-icons" = {
            "headphone" = "󰋋 ";
            "hands-free" = " ";
            "headset" = "󰋎 ";
            "phone" = " ";
            "portable" = " ";
            "car" = " ";
            "default" = [ " " " " " " ];
          };
          "on-click-right" = "foot -a pw-top pw-top";
          "on-click" = "pavucontrol";
        };
        "custom/power" = {
          "format" = "<span> </span>";
          "tooltip" = false;
          "on-click" = "wlogout";
        };
      };
    };
  };
}
