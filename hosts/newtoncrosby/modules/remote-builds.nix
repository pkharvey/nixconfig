{
  programs.ssh.knownHosts."100.107.23.115" = {
    publicKey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDI4IbP4dyTV0nv1XAt7wtqf2GwacrgDCseTTUosFtDF5+YtHUJfPY1KkDwjA5taeE7qSEWCtTX83QhawueHj9TANX3IN5SGn9XrCZthOB4QL2wCvwkts8Tyex1QTIA5d2JrcNRFtJohqFzhaPDYN+cq81W34DqthhzmfrPdfgb8k/QCoIWrQnP+JQBVyuSpnrgin3ad9ZdpNj2TcuUVQKTY0gUem/eVuyimt5SF6Gq8N3cBOuV07tiwpJPB3kLM4Rvhwp6KZlvcuVpvLQOdTYYSDMSRWt7qgEkzUNMM+cCbJNIuY/FmMyscINSrYlgKMMT0BCeML9Z9deO4WCCm+U5Tn9n/VSZrkZXCDDQp0MJSD71lo/11sPljuH7bTYD9Ubahkm7+VxIMJ0e2tFFQ5OFzCD7ELPV7fbmc55CnZQWTTZHE5dOqopkhtj6pYUYINW67QSSTop1u/uqhU8eUeaE/tU55jpoBpXLXaF1CtD16iq66uTOFPa4IN4PVfcE2iHyabnj0NvYtPDxKzDsF0QLs9JV5SZ49Tq5a9xFM3vBNAmEpKHgaGwqmjVgSMaW6wEFmoh53bsV+AGmZGY8AqGBCWRrz3eoz82l4IYat2wYzES4uxWAorkUGpE6TOrlFUm7boAz+TNow82U56XZ9Of6AvFGxl3b5uU8wl+JrmjUIQ==";
    hostNames = [ "100.107.23.115" ];
  };
  nix = {
    buildMachines = [{
      hostName = "100.107.23.115";
      sshUser = "ssh-ng://nix-ssh";
      system = "x86_64-linux";
      maxJobs = 24;
      speedFactor = 2;
      supportedFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];
      mandatoryFeatures = [];
    }];
    distributedBuilds = true;
    extraOptions = ''
      builders-use-substitutes = true
    '';
  };
}
