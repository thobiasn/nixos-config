{ pkgs, username, ... }:
{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us,dk";
      xkbOptions = "grp:toggle";
    };

    displayManager.autoLogin = {
      enable = true;
      user = "${username}";
    };
    libinput = {
      enable = true;
    };
  };
  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
