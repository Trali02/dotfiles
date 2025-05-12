{config, pkgs, lib, ...}:
{
    programs.rofi = {
        enable = true;
        theme = ./theme.rasi;
        package = pkgs.rofi-wayland;
    };
}