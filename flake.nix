{
  description = "Cloud configuration via opentofu";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = { nixpkgs, ... }:
  let
    inherit (nixpkgs) lib;
    supportedSystems = [ "x86_64-linux" ];
    forAllSystems = lib.genAttrs supportedSystems;
  in {
    devShells = forAllSystems (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        default = pkgs.mkShell {
          name = "cloud-config";
          packages = with pkgs; [
            opentofu
            hcloud
            just
          ];
          JUST_COMMAND_RUNNER = "blue";
        };
      }
    );
  };
}
