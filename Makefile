.PHONY: home
home:
	home-manager switch --flake .#hikiru

.PHONY: all
all:
	sudo nixos-rebuild switch --flake .
	home-manager switch --flake .#hikiru

.PHONY: clean
clean:
	nix-collect-garbage -d
