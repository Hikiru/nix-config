home:
	home-manager switch --flake . -b backup

system:
	sudo nixos-rebuild switch --flake .

all:
	sudo nixos-rebuild switch --flake .
	home-manager switch --flake .

update:
	nix flake update --commit-lock-file

clean:
	nix-collect-garbage -d
