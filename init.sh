#!/usr/bin/env bash

HOST=$1

if [[ -z $HOST ]]; then
    echo "Hostname not provided."
    exit 1
fi

echo "Making host \"$HOST\" directory..."
mkdir -p hosts/$HOST

echo "Copying hardware-configuration.nix..."
cp -f /etc/nixos/hardware-configuration.nix hosts/$HOST

echo "Adding new host to git..."
git add hosts/$HOST
git commit -m "Init new host: \"$HOST\""

echo "Activating configuration..."
sudo nixos-rebuild switch --flake .#$HOST

echo "Setting up chezmoi..."
chezmoi init git@github.com:Hikiru/dotfiles.git
chezmoi apply
