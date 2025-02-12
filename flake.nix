{
  description = "the-nest flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    flake-parts,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux"];

      perSystem = {pkgs, ...}: {
        devShells.default = pkgs.mkShell {
          name = "hugo";
          packages = with pkgs; [
            hugo
            go
          ];
        };
        packages.default = pkgs.stdenv.mkDerivation {
          pname = "wanderingcrow-site";
          version = builtins.substring 0 8 self.rev or "dirty";

          src = pkgs.lib.cleanSource ./.;

          nativeBuildInputs = with pkgs; [
            git
            hugo
            go
          ];

          buildPhase = ''
            ${pkgs.hugo}/bin/hugo --logLevel debug --minify --cleanDestinationDir --destination=public
          '';

          installPhase = ''
            mkdir -p $out
            cp -r public/* $out/
          '';
        };
      };
    };
}
