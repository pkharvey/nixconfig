{ lib, ... }:
{
  services.openssh = {
    enable = true;
    openFirewall = lib.mkForce true;
    settings.PasswordAuthentication = false;
    settings.PermitRootLogin = lib.mkForce "no";
  };
}

