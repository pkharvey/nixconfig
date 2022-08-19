{
  boot.kernelParams = [ "intel_iommu=on" "kvm.ignore_msrs=1" ];
  virtualisation = {
    kvmgt = {
      enable = true;
      vgpus = {
        "i915-GVTg_V5_4" = {
          uuid = [
            "68ccd598-1530-11ed-93a8-1b9cbd1cb192"
          ];
        };
      };
    };
  };
}
