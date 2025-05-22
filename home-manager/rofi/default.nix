{config, pkgs, lib, ...}:
{
    programs.rofi = {
        enable = true;
        theme = ./theme.rasi;
        package = pkgs.rofi-wayland;
    };
    xdg.configFile."rofi/images/nurture.png" = {
        source = ./nurture.png;
    };
}