{ config, pkgs, ... }:

let
  flyctl = pkgs.callPackage ../../pkgs/flyctl { };
in
{
  home.packages = [
    flyctl
  ];
}
