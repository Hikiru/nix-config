{ pkgs }:
let
  inherit (pkgs) callPackage;
in
{
  recursivelyImport = callPackage ./recursively-import.nix { };
}
