{
  services.udev.extraRules = ''
    # HackRF One
    ATTRS{idVendor}=="1d50", ATTRS{idProduct}=="6089", MODE="0666", ENV{ID_MM_DEVICE_IGNORE}="1", ENV{ID_MM_PORT_IGNORE}="1"
  '';
}
