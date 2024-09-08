{
  description = "linux-firmware main branch (EXPERIMENTAL - USE AT YOUR OWN RISK)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    linux-firmware-gitlab = {
      url = "gitlab:kernel-firmware/linux-firmware/main";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, linux-firmware-gitlab }: {
    defaultPackage."aarch64-linux" = nixpkgs.legacyPackages."aarch64-linux".stdenvNoCC.mkDerivation rec {
      pname = "linux-firmware";
      version = "20240908";

      src = linux-firmware-gitlab;

      nativeBuildInputs = [
        nixpkgs.legacyPackages."aarch64-linux".rdfind
        nixpkgs.legacyPackages."aarch64-linux".which
      ];

      installFlags = [ "DESTDIR=$(out)" ];

      dontFixup = true;

      meta = with nixpkgs.lib; {
        description = "Binary firmware collection packaged by kernel.org";
        homepage = "https://gitlab.com/kernel-firmware/linux-firmware.git";
        license = licenses.unfreeRedistributableFirmware;
        platforms = platforms.linux;
        maintainers = with prev.linux-firmware.maintainers; [ thenightmancodeth ];
        priority = 6;
      };
    };
  };
}
