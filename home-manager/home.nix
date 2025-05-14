{ config, pkgs, ... }: {
  fonts.fontconfig.enable = true;
  nixpkgs.config.allowUnfree = true;
  imports = [ ./nvim ./waybar ./rofi ];
  home = {
    username = "trali";
    homeDirectory = "/home/trali";
    stateVersion = "24.11";
    packages = with pkgs; [
      nixfmt
      rustup
      libgcc
      gcc
      helix
      pavucontrol
      thefuck
      htop
      gnome-tweaks
      zig
      pokeget-rs
      zls
      hyprshot
      discord
      dotnet-sdk_9
      networkmanager
      networkmanagerapplet
      (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
    ];
  };
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      exec-once = "waybar & nm-applet --indicator &";
      general = {
        "col.active_border" = "rgb(98971a)";
        "gaps_out" = 5;
        "gaps_in" = 3;
        "resize_on_border" = true;
      };
      monitors = { "monitor" = "eDP-1, 1920x1080@60, 0x0, 1.25"; };
      bind = [
        "ALT, SPACE, exec, rofi -show drun -show-icons"
        "$mod, RETURN, exec, kitty"
        "$mod, Q, killactive"
        "CTRL, right, resizeactive, 10 0"
        "CTRL, left , resizeactive, -10 0"
        "CTRL, up, resizeactive, 0 -10"
        "CTRL, down, resizeactive, 0 10"
        "$mod, left, workspace, -1"
        "$mod, right, workspace, +1"
        "$mod, T, togglefloating"
        " , PRINT, exec, hyprshot -m output"
      ];
      input = {
        kb_layout = "de";
        kb_options = "caps:swapescape";
        touchpad = { natural_scroll = true; };
      };
      decoration = { rounding = 7; };
      gestures = { "workspace_swipe" = true; };
    };
  };
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      shell = "zsh";
      dynamic_background_opacity = true;
      background_opacity = 0.6;
      background_blur = 5;
      selection_foreground = "#ebdbb2";
      selection_background = "#d65d0e";
      background = "#32302f";
      foreground = "#ebdbb2";
      color0 = "#3c3836";
      color1 = "#cc241d";
      color2 = "#98971a";
      color3 = "#d79921";
      color4 = "#458588";
      color5 = "#b16286";
      color6 = "#689d6a";
      color7 = "#a89984";
      color8 = "#928374";
      color9 = "#fb4934";
      color10 = "#b8bb26";
      color11 = "#fabd2f";
      color12 = "#83a598";
      color13 = "#d3869b";
      color14 = "#8ec07c";
      color15 = "#fbf1c7";
      cursor = "#bdae93";
      cursor_text_color = "#665c54";
      url_color = "#458588";

    };
  };
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch";
      fetch = "pokeget random --hide-name | fastfetch --file-raw -";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
      theme = "strug";
    };
  };
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
  };
  programs.home-manager = { enable = true; };
  programs.fastfetch = { enable = true; };
  programs.wlogout = { enable = true; };
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      splash_offset = 2.0;
      preload = [ "/home/trali/Pictures/wild_youth.png" ];
      wallpaper = [ ",/home/trali/Pictures/wild_youth.png" ];
    };
  };
}
