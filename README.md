# nvim-config

## Introduction

This repository holds my neovim config files. I plan for this to be a living document, so as I make changes, it gets iterated.

I'm fairly certain this config will be useful for a super beginner, as if there is documentation it will include *"obvious"* steps, that are sometiems glossed over, or more elaboration on some edge-case behaivor. This is so that it can be used as a reference/entry point for a complete beginner. This is not a  replacement for many other tutorials. I'm treating this as an accessable cliff-notes version of "How to make Neovim somewhat useable sometimes". 

The assumptions made will be that the user knows how to open their terminal, and how to open vi, vim, or nano, but still interfaces with the gui regularly.

The NeoVim docs are extensive, but can sometimes be overwhelming, and the `nvim :help nvim :Tutor` sequence used to learn basic vim motions is not exhaustive when it comes to the Neovim ecosystem. When I do make notes, they are written so that I can reference them, so basic steps are outlined. 

There will be an archive folder which will have the my old config files and setups, including plugins, in the case I want to revert.

Having this managed well, will lead to me being able to keep track of changes, vimscript, and lua changes, and also allow me to quickly get my config, in the case that I'm using a weird shell where the NeoVim installation is not the one in $APPDATA.

## Setup

### Installing Neovim

**This configuration uses the *lazy.nvim* package manager, and  requires >= Neovim v0.8**

To ensure you have this version first check your version of neovim: `nvim --version`.
If this is greater than 0.8, you are good.

If you are stuck on version 0.7, follow the instructions on [the Neovim Install Instructions Gitub page](http://github.com/neovim/neovim/blob/master/Install.md]. The relevant-to-me sections are copied below for convience.


> *Windows*
> 1. For windows systems, it is easy to get the most recent stable release of neovim.
>     - On `cmd.exe` use either `winget install Neovim.Neovim`
>     - or `choco install neovim --pre`
> 
> *Linux*
> - Ubuntu tends to have older versions. Even with using `sudo add-apt-repository ppa:neovim-ppa/stable -y`, I can only get up to version 0.7.2. 
> 
> - Instead follow the instructions on [the Neovim Github Install Instructions](https://github.com/neovim/neovim/blob/master/INSTALL.md), summarized here:
> 
>    1. Specific binary installation
>         1. Download the release
>         ```bash
>         curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
>         sudo rm -rf /opt/nvim
>         sudo tar -C /opt -xzf nvim-linux64.tar.gz
>         ```
>         1. Add the file to your PATH by adding this to your ~/.bashrc file
>         ```bash
>         # ~/.bashrc
>         export PATH="$PATH:/opt/nvim-linux64/bin"
>         ```
>   1. AppImage (Universal) 

## Notes on architecutre Architecture

Before creating this repository I did have some vim configuration. However, I needed to maintain it in multiple locations due to the fact that I use multiple different shells  (ex. MSYS2, Powershell, WSL(Ubuntu), AmazonLinux, Command Prompt, etc)in both local and server environments.

The config I had was fairly minimal, and made the editor usable.

### Annotated Directory Structure in this Repo

    ┬
    ├─README.md
    ├─archive
    │   ├─old_configs
    │   │   ├─lua
    │   │   │   └─init.lua
    │   │   └─vimscript
    │   │   
    │   ├─plugins
    │   ├─init.lua
    │   ├─lazy-lock.json

### Annotated Directory Structure In this Repo (ASCII)

    .
    +-- README.md
    +-- archive -- Will get less annotation b/c it is old.
    |       +-- old_configs
    |       |   +-- lua
    |       |   |    +-- init.lua
    |       |   +-- vimscript
    |       |       +-- 01
    |       |       |   +-- init.vim
    |       |       +-- 02
    |       |           +-- init.vim
    |       +-- plugins
    |       |   +-- telescope.lua
    |       +-- init.lua
    |       +-- lazy-lock.json
    +-- config

## TODO

- [ ] Complete directory structure and annotation
