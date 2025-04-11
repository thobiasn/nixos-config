{ config, pkgs, ... }:

let
  supabase-cli = pkgs.callPackage ../../pkgs/supabase-cli { };
in
{
  home.packages = [
    supabase-cli
  ];
}
