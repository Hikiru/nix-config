home:
	home-manager switch --flake . -b backup

system:
	sudo nixos-rebuild switch --flake .

test:
	sudo nixos-rebuild test --flake .

all:
	sudo nixos-rebuild switch --flake .
	sleep 1
	home-manager switch --flake .

update:
	nix flake update --commit-lock-file
	just all

clean:
	nix-collect-garbage -d
