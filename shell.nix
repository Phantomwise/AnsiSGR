{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShellNoCC {
	packages = with pkgs; [
		(haskellPackages.ghcWithPackages (ps: with ps; [
			directory
		]))
		gnumake     # for `make`
		util-linux  # for `script`
	];
}
