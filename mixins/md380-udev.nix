{
  services.udev.extraRules = ''
    # Tytera MD380 / Retevis RT3 radio
    ATTRS{idVendor}=="0483", ATTRS{idProduct}=="df11", MODE="0666", ENV{ID_MM_DEVICE_IGNORE}="1", ENV{ID_MM_PORT_IGNORE}="1"
  '';
}
