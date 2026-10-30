{
  self,
  inputs,
  ...
}: let
  inherit (inputs.nixpkgs.lib) nixosSystem;
  mod = "${self}/system";
  home = "${self}/home";

  inherit (import "${self}/system") desktop laptop;

  specialArgs = {
    inherit inputs self;
    username = "holographic";
  };
in {
  yoga = nixosSystem {
    inherit specialArgs;
    modules =
      desktop
      ++ laptop
      ++ [
        ./yoga
        "${mod}/services/gnome-services.nix"
        "${mod}/core/limine.nix"
        "${home}"
      ];
  };
}
