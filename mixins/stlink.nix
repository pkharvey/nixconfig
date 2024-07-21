{
  services.udev.extraRules = ''
    # ST Microelectronics ST-LINK/V2 in-circuit debugger/programmer for STM8 and STM32
    ATTRS{idVendor}=="0483", ATTRS{idProduct}=="3748", MODE="0666", ENV{ID_MM_DEVICE_IGNORE}="1", ENV{ID_MM_PORT_IGNORE}="1"
  '';
  home-manager.users.pasha = { pkgs, ... }: {
    home.packages = with pkgs; [
      stm32cubemx
      #stm32loader
      stm32flash
      stm8flash
      stlink
    ];
  };
}
