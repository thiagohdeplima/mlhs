{ pkgs, lib, config, ... }:

{
  languages.haskell = {
    enable       = true;
    cabal.enable = true;
  };
}