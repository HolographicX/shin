{
  config,
  lib,
  pkgs,
  self,
  username,
  ...
}: {
  imports = [./hardware-configuration.nix];

  networking.hostName = "yoga";

  hardware = {
    enableRedistributableFirmware = true;
    cpu.intel.updateMicrocode = true;
    i2c.enable = true;
  };

}

