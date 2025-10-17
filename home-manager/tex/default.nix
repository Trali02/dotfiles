{ config, pkgs, lib, ...}:
let 
  tex = (pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-medium xifthen ifmtarg framed paralist titlesec;
  });
in
{
  home.packages = [
    tex
  ];
}