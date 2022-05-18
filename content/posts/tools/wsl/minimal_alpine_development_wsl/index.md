---
title: "Nix + Home-manager for development environments in WSL"
date: 2022-05-10
tags: ["tools", "nix", "wsl"]
author: "@atorizv"
showToc: true
TocOpen: false
draft: false
hidemeta: false
comments: true
description: ""
canonicalURL: "https://canonical.url/to/page"
disableHLJS: true # to disable highlightjs
disableShare: false
disableHLJS: false
hideSummary: false
#searchHidden: false
ShowReadingTime: true
ShowBreadCrumbs: false
ShowPostNavLinks: true
---
<div style="text-align: justify"> 

# Introduction-
For some time now, I've been searching the best way to create a reproducible development environment that avoids me the tedious task of installing and configuring my work tools over and over again, I'm talking about you, VIM. I know there are several tools to manage the famous `.dot` files, but I wanted to find a way to group everything together. That's when I found **Nix**, a functional language that acts as a package manager and simplifies the creation of reproducible environments; there's even a Linux distribution that revolves around it, [**NixOs**](https://nixos.org/) and as you might guess, it allows to configure and manager your system. After a couple days of trying to understand the syntax of the language, I accomplish my goal. Here's how I did it.

# First steps 
## WSL
First of all, we have to enable and install **Windows Subsytem for Linux** (WSL). Let's open **PowerShell** as administrator and run:

```powershell 
wsl --install
```


{{< notice note >}}
If it does not allow you to do so, its most likely that your system has disable that option. To enable it, run:

```powershell 
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

Then, reboot your system.

{{< /notice >}}

Now, let's choose a distribution of your liking, in my case I chose [Alpine](https://github.com/yuk7/AlpineWSL) for its lightness and not having bloatware. To see a list of available distributions for installation, run:

```powershell 
wsl --list --online
# Once you've selected one of your liking, run
wsl --install --distribution <Name>
```

In case you want another one, I suggest you to look up online. Once you have your distribution installed and have made the initial configuration (e.g. creating a user, password and updating your system `sudo apt update && sudo apt upgrade`), you will be ready to install **Nix**.

## Nix
Nix installation is pretty straight forward. Open WSL and run:

```bash {linenos=inline}
sh <(curl -L https://nixos.org/nix/install) --no-daemon
# To test your installation, run
nix --version
# Restart your session if necessary
```

## Home-Manager
Okay, assuming you have a functional **Nix** installation, let's move on with **Home-Manager**, a tool that will allow us to manage our user environment, allowing to declare the packages we want to install as well as their respective configurations.

First, given we are not using NixOs, we need to run the following command:

```bash
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}
```

Then, let's add a new package source and update the list:

```bash {linenos=inline}
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
```

Now, let's install home-manager

```bash
nix-shell '<home-manager>' -A install
```

The only thing that's left is editing home-manager configuration file located in `$HOME/.config/nixpkgs/home.nix`.

# Setting up our environment

Editing `home.nix` may be as hard as you want it to be. It all depends on the level of customization your want to achieve. You may use the following code as a template to start:

```nix {linenos=inline}
{ config, pkgs, ... }:

{
  # Home manager needs information about you
	and the directory it will manage
	home.username = "<user>";
	home.homeDirectory = "/home/<user>";

	# Optional ** Session variables
	home.sessionVariables = {
	  EDITOR = "<TextEditor>";
    };

	# Packages to install without configuration 
	home.packages = with pkgs; [
	  /* 
		.
		.
		.
		*/
    ];

  # Packages to install and configure
	programs = {
	  /*
		e.g
		git = {
          enable = true;
          usernName = "<user>";
          userEmail = "<email>";
        };
		.
		.
		.
		*/
    };


	/* This value determines the Home Manager release that your
	configuration is compatible with. This helps avoid breakage
	when a new Home Manager release introduces backwards
	incompatible changes.

	You can update Home Mangaer without changing this value. See
	the Home Manager release notes for a list of state version
	changes in each release.
	*/
	home.stateVersion = "22.05";

  # let Home Manager install and manage itself.
	programs.home-manager.enable = true;
}
```

You can use [NixOs wiki](https://nixos.wiki/) and its [search bar](https://search.nixos.org/packages) to find packages and their respective configuration options. At the end, you could end up with a file like [mine](https://github.com/Athansya/nixfiles/blob/main/home.nix). Once you've finished, you need to activate your new configuration:

```bash
home-manager switch
```

And that's all, you now have a functional development environment. I recommend you to create a repository to make it accesible from different machines.

# Final notes
To wrap things up, I would like to talk about the concept of generation. Every time we make a change in our configuration, in both **Nix** and **Home Manager**, a new generation is produced. In case we have a problem with the new changes, we can always go back to the previous version (rollback). To list and manipulate the generations available in our system we use the following commands:

**Nix**
```bash {linenos=inline}
# List generations
nix-env --list-generations

# Rollback to previous gen
nix-env --rollback

# Change to a specific gen
nix-env --switch-generation <id-generación>

# Delete certain gens
nix-env --delete-generations <id-generaciones separados por espacios>

# Delete certain gens except the las <N>
nix-env --delete-generations +<N>

# Delete all gens except for the current one
nix-env --delete-generations old

# Garbage collection
nix-collect-garbage
```

**Home Manager**
```bash {linenos=inline}
# List generations
home-manager generations

# Delete certain gens
home-manager remove-generations <id-generaciones separados por espacios>

# Delete gens before <timestamp> (e.g. -30 days)
home-manager expire-generations <timestamp>
```

{{%notice info %}}
It is not currently possible to change generations in home-manager with a simple command, but the way of doing it is the following:
1. List generations and identify the ID of your liking: `home-manager generations`
2. Copy the ID's path -> (e.g.`/nix/store/kahm1rxk77mnvd2l8pfvd4jkkffk5ijk-home-manager-generation`)
3. Run the `activate` script located in: `/nix/store/kahm1rxk77mnvd2l8pfvd4jkkffk5ijk-home-manager-generation/activate`. 
{{% /notice %}}

# References
- NixOs, **"Getting Nix / NixOs"** n.d. [Online]. Available: <https://nixos.org/download.html#nix-install-windows>.
- NixOs Wiki, **"Home Manager"** n.d. [Online]. Available: <https://nixos.wiki/wiki/Home_Manager>.
- Nix Community, **"Home Manager Manual"** n.d. [Online]. Available: <https://nix-community.github.io/home-manager/>.
- F. Mouaffo, **"Nix introduction, Main Concepts and commands"** Adaltas 01-Feb-2022. [Online]. Available: <https://www.adaltas.com/en/2022/02/01/nix-introduction/>.
- C. Bailey, **"A minimal development environment on WSL"** 04-Apr-2021. [Online]. Available: <https://cbailey.co.uk/posts/a_minimal_nix_development_environment_on_wsl>. 
- M. Gheda, **"Tutorial: Getting started with Home Manager for Nix"** 05-April-2021. [Online]. Available: <https://ghedam.at/24353/tutorial-getting-started-with-home-manager-for-nix>
- NixOs Wiki, **"Nix Cookbook: Managing storage"** n.d. [Online]. Available: <https://nixos.wiki/wiki/Nix_Cookbook>.
- A. Pearce, **"Managing dotfiles with Nix"** 27-Jul-2021. [Online]. Available: <https://alexpearce.me/2021/07/managing-dotfiles-with-nix/>.

</div>


