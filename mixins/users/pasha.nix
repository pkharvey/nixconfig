{ pkgs, lib, config, ... }:
{
  nix.trustedUsers = [ "pasha" ];
  users.users.pasha = {
    hashedPassword = "$6$klVCWEvfSz9c7NYW$9MwiM6X5xhbK00IMTTiL1SSrWd2Dv.tx7sC3.P4i.AZs2/KLS7ZPy2JrDj/svDEp8Y3mJ18hl.D0co7jHEe/7/";
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "dialout"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH6RXIoWSRey0xV2khmeNkM0ztVz7B1RHycTl/Ovq3hL"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB2hSitdOmLziKfsJBeph5T5iUrSjRSCleJuYY8812Mh"
    ];
  };
}
