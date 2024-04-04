{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};

          scripts.serve = pkgs.writeShellScriptBin "serve" ''
            cd "$(git rev-parse --show-toplevel)"
            ${pkgs.mdbook}/bin/mdbook serve
          '';
        in
        {
          devShell = pkgs.mkShell {
            buildInputs = with pkgs; [
              mdbook
              mdbook-mermaid

              scripts.serve
            ];
          };

          shellHook = ''
            echo "Commands:"
            echo "  serve - runs mdbook to watch & serve"
          '';
        }
      );
}
