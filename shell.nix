{ nixpkgs ? import <nixpkgs> {} }:

with nixpkgs;
with pkgs;

let
  drv = callPackage ./default.nix {};
in
  drv.overrideAttrs (oldAttrs: {
    src = lib.cleanSource ./.;
  })
