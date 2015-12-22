let pkgs = import <nixpkgs> {};
in pkgs.haskellPackages.callPackage ./myLib.nix {}
