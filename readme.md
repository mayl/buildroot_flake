# buildroot_flake

Simple flake builds buildroot projects on nixos.

Buildroot hardcodes `/usr/bin/` paths, which is why this project uses
a `FHSuserEnv` instead of a basic `mkShell`.

The cross toolchain used is `AARCH64` but can be modified for other
architectures by modifying the `pkgsCross` path to the cross compiling gcc.
