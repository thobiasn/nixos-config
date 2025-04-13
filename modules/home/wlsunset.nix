# flake.nix snippet
{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    wlsunset
  ];

  # Optional: wlsunset config in systemd service or manually via Hyprland exec
}
