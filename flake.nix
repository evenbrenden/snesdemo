{
  description = "snesdemo";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };
    in {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs;
          let
            emulators = with pkgs; [
              (callPackage (import ./nix/bsnes-wrapper.nix) { })
              snes9x-gtk
            ];
            ft2-clone-patched =
              pkgs.callPackage (import ./nix/ft2-clone.nix) { };
            trse = pkgs.libsForQt5.callPackage (import ./nix/trse.nix) { };
          in [ cc65 ft2-clone-patched trse wine ] ++ emulators;
      };
    };
}
