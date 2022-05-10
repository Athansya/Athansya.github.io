{
  description = "devShell";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
    let pkgs = nixpkgs.legacyPackages.${system}; in
    rec {
      devShell = pkgs.mkShell {
        buildInputs = with pkgs; [ hugo ];

        shellHook = ''
          echo "nix devShell - Hugo enabled"
        '';
      };
    }
  );
}
