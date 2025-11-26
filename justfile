system:
	sudo nixos-rebuild switch --flake .

test:
	sudo nixos-rebuild test --flake .

update:
	nix flake update --commit-lock-file
	just

clean:
	sudo nix-collect-garbage -d
