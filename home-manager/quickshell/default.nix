{config, pkgs, lib, inputs, ...}:
let
  unstable = import inputs.nixpkgs-unstable { system = pkgs.system; };
in
{
  home.packages = [
    unstable.quickshell
  ];
  # xdg.configFile."niri/config.kdl".source = ./config.kdl;
}