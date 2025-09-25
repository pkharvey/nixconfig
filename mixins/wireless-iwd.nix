{ pkgs, lib, inputs, config, ... }:

let
  n1 = (pkgs.writeText "DoESLiverpool.psk" ''
    [Security]
    Passphrase=decafbad00
  '');
  n2 = (pkgs.writeText "Test 6G.psk" ''
    [Security]
    Passphrase=decafbad00
  '');
in
{
  config = {
    environment.systemPackages = [ pkgs.iwgtk ];
    networking.wireless.iwd = {
      enable = true;
      settings.General.EnableNetworkConfiguration = true;
      settings.General.AddressRandomization = "once";
    };
    systemd.tmpfiles.rules = [
      "C /var/lib/iwd/DoESLiverpool.psk 0600 root root - ${n1}"
      "C /var/lib/iwd/Test 6G.psk 0600 root root - ${n2}"
    ];
  };
}

