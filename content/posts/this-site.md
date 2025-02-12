+++
title = "This Site"
date = "2025-02-12T10:24:31-05:00"
#dateFormat = "2006-01-02" # This value can be configured for per-post date formatting
author = "Crow"
tags = ["nix", "selfhosting"]
description = ""
showFullContent = false
readingTime = false
hideComments = false
+++

The Nest uses [hugo](https://gohugo.io), a static site generator to build the
pages. These pages are then hosted on my home server, managed by nix.

For those interested, nix is a functional language used primarily in
[NixOS](https://nixos.org) for managing system configurations declaratively, but
it's useful for many things like packaging software.

For example, I have the following flake to manage my "dev" environment for the
site, as well as making a package for the site that can be deployed on a host.

```nix
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
```

Then on the config for my homeserver, I have the following expression

```nix
{
  lib,
  config,
  inputs,
  ...
}:
lib.mkIf config.user.overseer.enable {
  services = {
    nginx = {
      enable = true;
      recommendedProxySettings = true;
      virtualHosts = {
        "wanderingcrow.net" = {
          forceSSL = true;
          useACMEHost = "wanderingcrow.net";
          locations."/" = {
            root = inputs.the-nest.outputs.packages.x86_64-linux.default;
          };
        };
      };
    };
  };
}
```
