# Nix flake providing main branch of gitlab:kernel-firmware/linux-firmware/main

This can be used as an overlay in your main flake

``` nix
{ 
    description = "Your flake description";
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        linux-firmware-git.url = "github:TheNightmanCodeth/linux-firmware-git-flake";
    };

    outputs = { self, nixpkgs, linux-firmware-git }: {
        nixpkgs.overlays = [
            (final: prev: {
                linux-firmware = linux-firmware-git;
            })
        ];
        
        # The rest of your config...
    };
}
```

# Work In Progress

This is not ready yet, it only works for `aarch64-linux` installs until I confirm it works at all.
