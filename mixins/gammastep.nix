{ pkgs, ... }:

{
  config = {
    home-manager.users.pasha = { pkgs, ... }: {
      services.gammastep.settings = {
        enable = (pkgs.system == "x86_64-linux");
        latitude = "53.4";
        longitude = "-3.0";
        temperature.day = 6500;
        temperature.night = 1000;
        adjustment-method = "wayland";
        #extraOptions = [ "-v" ];
      };
    };
  };
}
