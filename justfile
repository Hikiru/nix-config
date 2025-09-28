home:
	home-manager switch --flake . -b backup

all:
	sudo nixos-rebuild switch --flake .
	home-manager switch --flake .

clean:
	nix-collect-garbage -d
