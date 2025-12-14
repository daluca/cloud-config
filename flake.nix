{
  description = "Cloud configuration via opentofu";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    git-hooks.url = "github:cachix/git-hooks.nix";
    git-hooks.inputs.nixpkgs.follows = "nixpkgs";

    treefmt.url = "github:numtide/treefmt-nix";
    treefmt.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, git-hooks, treefmt }:
  let
    inherit (nixpkgs) lib;
    supportedSystems = [ "x86_64-linux" ];
    forAllSystems = lib.genAttrs supportedSystems;
    pkgs' = system: nixpkgs.legacyPackages.${system};
  in {
    checks = forAllSystems (system:
      let
        pkgs = pkgs' system;
      in {
        pre-commit = git-hooks.lib.${system}.run {
          src = ./.;
          hooks = {
            check-added-large-files.enable = true;
            check-merge-conflicts.enable = true;
            detect-private-keys.enable = true;
            end-of-file-fixer.enable = true;
            forbid-new-submodules.enable = true;
            trim-trailing-whitespace.enable = true;
            typos.enable = true;
            deadnix = {
              enable = true;
              settings.edit = true;
            };
          };
        };
        formatting = (treefmt.lib.evalModule pkgs ./treefmt.nix).config.build.check self;
      }
    );

    formatter = forAllSystems (system:
      let
        pkgs = pkgs' system;
      in
        (treefmt.lib.evalModule pkgs ./treefmt.nix).config.build.wrapper
    );

    devShells = forAllSystems (system:
      let
        pkgs = pkgs' system;
      in {
        default = pkgs.mkShell {
          inherit (self.checks.${system}.pre-commit) shellHook;
          name = "cloud-config";
          packages = with pkgs; self.checks.${system}.pre-commit.enabledPackages ++ [
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
