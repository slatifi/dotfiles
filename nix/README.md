# Saif's Nix Darwin Config

To install the darwin modules once the flake is located at git/dotfiles/nix, run:

```
nix run nix-darwin --extra-experimental-features "nix-command flakes" --switch --flake ~/git/dotfiles/nix#firebolt
```

Ensure that **both** the dotfile repo (this one) and nvim-config are cloned within the same directory.

Then to run the config, run the following command from the nix directory:

```
darwin-rebuild switch --flake .#firebolt
```

---

### Steps for setting up a new machine:
1. Install Nix
2. Add ssh keys and config to '~/.ssh'
3. Clone this repo to '~/git/dotfiles' and if required, add a '.secrets' file to the repo root
4. Clone the nvim config to '~/git/nvim-config'
5. Replace the hostname in the flake.nix file and the command above
6. Run the above command to install the config
7. Run `drb`
