{ pkgs, lib, config,  ... }:
{
  environment.systemPackages = [
    pkgs.wireshark
  ];

  programs.wireshark.enable = true;

  users.groups = {
    wireshark = {};
  };

  users.users.pasha.extraGroups = [
    "wireshark"
  ];
}
