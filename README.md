# Tralis Nixos config

Using [Misterio77s nix-starter-config](https://github.com/Misterio77/nix-starter-configs) as a starting point.

To build a config just run 
```
sudo nixos-rebuild switch --flake .#{configName}
```
inside the root of this repository.

To build the homemanager config just run 
```
home-manager switch --flake .#{userName}@{configName}
```
