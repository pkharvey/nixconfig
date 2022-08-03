{
  systemd.services.systemd-networkd-wait-online.enable = false;
  networking = {
    useNetworkd = true;
    firewall = {
      checkReversePath = "loose";
      trustedInterfaces = [ "tailscale0" ];
    };
  };
  services = {
    tailscale.enable = true;
    resolved = {
      enable = true;
      dnssec = "false";
    };
  };
}
