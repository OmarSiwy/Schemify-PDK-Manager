{
  description = "Schemify PDK manager plugin: per-project PDK installs";

  # nixpkgs pinned to the rev Schemify's flake.lock pins: the same rustc (1.95) and wasm-ld, so
  # `nix develop -c ./build.sh` reproduces the committed pdk_manager.wasm byte for byte.
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { nixpkgs, ... }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAll = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
    in
    {
      devShells = forAll (pkgs: {
        default = pkgs.mkShell {
          # nixpkgs' rustc ships the wasm32-unknown-unknown std; lld for wasm-ld (no rust-lld).
          packages = with pkgs; [
            rustc
            cargo
            clippy
            rustfmt
            lld
          ];
        };
      });
      formatter = forAll (pkgs: pkgs.nixfmt);
    };
}
