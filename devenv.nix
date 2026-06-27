{ pkgs, lib, config, ... }:

{
  packages = with pkgs; [
    git
    pkg-config
    blas
    lapack
  ];

  languages.haskell = {
    enable        = true;
    cabal.enable  = true;
  };
}
