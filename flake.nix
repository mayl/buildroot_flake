{
  description = "Example flake environment for build buildroot projects";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ ];
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
      perSystem = { config, self', inputs', pkgs, system, ... }: {
        devShells.default = (pkgs.buildFHSUserEnv {
          name = "buildroot";
          targetPkgs = pkgs: (with pkgs;
            [
              (lib.hiPrio gcc)
              file
              gnumake
              ncurses.dev
              pkg-config
              pkgsCross.aarch64-multiplatform.gccStdenv.cc
            ] ++ pkgs.linux.nativeBuildInputs);
        }).env;
      };
      flake = {
      };
    };
}
