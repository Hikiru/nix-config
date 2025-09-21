.PHONY: update
update:
	home-manager switch --flake .#hikiru

.phony: clean
clean:
	nix-collect-garbage -d
