{ lib, ... }:
{
  services.openssh = {
    enable = true;
    openFirewall = lib.mkForce true;
    settings.passwordAuthentication = false;
    settings.PermitRootLogin = lib.mkForce "no";
  };
}

