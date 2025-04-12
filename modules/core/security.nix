{ pkgs, ... }:
{
  security.rtkit.enable = true;
  security.sudo.enable = true;
  security.pam.services.swaylock = { };
  security.pam.services.hyprlock = { };

  ## 🧱 AppArmor or SELinux (optional but good if you want MAC framework)
  # NOTE: Requires kernel and extra work, optional on desktop/laptop
  # iisecurity.apparmor.enable = true;
  
  environment.systemPackages = with pkgs; [
    aide          # Advanced Intrusion Detection Environment
  ];
  
  boot.kernel.sysctl = {
    "kernel.kptr_restrict" = 2;
    "kernel.dmesg_restrict" = 1;
    "fs.protected_fifos" = 2;
    "fs.protected_regular" = 2;
    "fs.suid_dumpable" = 0;
    "kernel.unprivileged_bpf_disabled" = 1;
    "net.ipv4.conf.all.send_redirects" = 0;
    "net.ipv4.conf.default.send_redirects" = 0;
    "net.ipv6.conf.all.accept_redirects" = 0;
    "net.ipv6.conf.default.accept_redirects" = 0;
  };
}
