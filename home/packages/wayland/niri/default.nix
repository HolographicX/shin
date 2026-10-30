{
  config,
  inputs,
  pkgs,
  ...
}: let
  settings = import ./_settings.nix {};
  binds = import ./_binds.nix {inherit pkgs;};
  rules = import ./_rules.nix;

  validatedConfig = inputs.niri.lib.internal.validated-config-for pkgs config.programs.niri.package config.programs.niri.finalConfig;
in {
  imports = [
    inputs.niri.nixosModules.niri
    inputs.niri.lib.internal.settings-module
  ];

  programs.niri = {
    enable = true;
    package = inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.niri-unstable;
    settings = settings // {inherit binds;} // rules;
  };

  environment.sessionVariables = {
    NIRI_CONFIG = "$HOME/.config/niri/config.kdl";
  };

  systemd.user.services.niri-flake-polkit.enable = false;

  xdg.configFile."niri/config.kdl".source = pkgs.runCommand "niri-config.kdl" {} ''
    printf 'include "noctalia.kdl"\n' > $out
    cat ${validatedConfig} >> $out
  '';
}
