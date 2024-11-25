{ pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    # driSupport = true;
    enable32Bit = true;
    # extraPackages = with pkgs; [
    #   rocm-opencl-icd
    #   rocm-opencl-runtime
    # ];
  };
}
