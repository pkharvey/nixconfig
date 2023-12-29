{
  services.udev.extraRules = ''
    # DreamSourceLab DSLogic Logic Analyzer
    ATTRS{idVendor}=="2a0e", MODE="0666", ENV{ID_MM_DEVICE_IGNORE}="1", ENV{ID_MM_PORT_IGNORE}="1"
  '';
  home-manager.users.pasha = { pkgs, ... }: {
    home.packages = with pkgs; [
      dsview
    ];
  };
}
