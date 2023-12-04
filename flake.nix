{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";

    jhcr.url = "github:lep/jhcr";
    jhcr.inputs.nixpkgs.follows = "nixpkgs";

    pjass.url = "github:lep/pjass";
    pjass.inputs.nixpkgs.follows = "nixpkgs";

    mpq.url = "github:lep/mpq-hs";
    mpq.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, jhcr, pjass, mpq, ... }:
    let pkgs = import nixpkgs { system = "aarch64-darwin"; };
    in {
      devShells."aarch64-darwin".default = pkgs.mkShell {
        packages = [
          jhcr.packages.aarch64-darwin.jhcr
          pjass.packages.aarch64-darwin.pjass
          mpq.packages.aarch64-darwin.mpq
        ];
      };
    };
}
