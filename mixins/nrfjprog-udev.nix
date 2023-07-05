{
  services.udev.extraRules = ''
    # SEGGER J-Link
    ATTRS{idVendor}=="1366", MODE="0666", ENV{ID_MM_DEVICE_IGNORE}="1", ENV{ID_MM_PORT_IGNORE}="1"
  '';
}
