{
  services.avahi = {
    openFirewall = true;
    nssmdns4 = true; # Allows software to use Avahi to resolve. Useful for printer name resolving, for example.
    enable = true;
    publish = {
      enable = true;
      addresses = true;
      workstation = true;
    };
  };
}

