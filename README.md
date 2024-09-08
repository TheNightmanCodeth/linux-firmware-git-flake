# Work In Progress

This is not ready yet, it only works for `aarch64-linux` systems. 
That's probably the only systems that would find value in this anyway since there seems to be new progress made every day on those machines.

If you're on an aarch64 system, this can be used as an overlay in your system configuration

``` nix
{ 
    description = "Your flake description";
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        linux-firmware-git.url = "github:TheNightmanCodeth/linux-firmware-git-flake";
    };

    outputs = { self, nixpkgs, linux-firmware-git }: {
        nixosConfigurations = {
            your-host = nixpkgs.lib.nixosSystem {
                inherit system;
                modules = [
                    ...
                    ({ ... }: {
                        nixpkgs.overlays = [
                            (final: prev: {
                                linux-firmware = linux-firmware-git.nixosModules.default;
                            })
                        ];
                        ...
                    })
                ];
            };
        };
    }
}
```
