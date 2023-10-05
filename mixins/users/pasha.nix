{ pkgs, lib, config, ... }:
{
  nix.settings.trusted-users = [ "pasha" ];
  users.users.pasha = {
    hashedPassword = "$6$klVCWEvfSz9c7NYW$9MwiM6X5xhbK00IMTTiL1SSrWd2Dv.tx7sC3.P4i.AZs2/KLS7ZPy2JrDj/svDEp8Y3mJ18hl.D0co7jHEe/7/";
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "dialout"
      "plugdev"
      "docker"
    ];
    openssh.authorizedKeys.keys = [
      "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIApZlVXP4T+TMUbLhduKIA4yF8vmJY1Boi+Hoh0mC20mAAAABHNzaDo=" # backup key
      "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIMKBLIyVMKoh2zkGCKQYA4vJoHQ8y4faKcyq6K4ItrtsAAAABHNzaDo=" # dailyuse key
    ];
  };
}
