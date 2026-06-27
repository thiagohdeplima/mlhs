{ pkgs, lib, config, ... }:

{
  packages = with pkgs; [ git ];

  languages.haskell = {
    enable        = true;
    cabal.enable  = true;
  };
}
