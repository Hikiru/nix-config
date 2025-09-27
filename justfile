home:
	home-manager switch --flake .#hikiru

all:
	sudo nixos-rebuild switch --flake .
	home-manager switch --flake .#hikiru

clean:
	nix-collect-garbage -d
