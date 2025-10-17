{ pkgs, lib, ... }: {  
  xdg.configFile."waybar/config".source = ./config.jsonc;
  programs.waybar = {
    enable = true;
    style = (builtins.readFile ./style.css);
    
  };
}
