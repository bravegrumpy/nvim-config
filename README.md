# nvim-config

## Introduction

This repository holds my neovim config files. I plan for this to be a living document, so as I make changes, it gets iterated.

I'm fairly certain this config will be useful for a super beginner, as if there is documentation it will include *"obvious"* steps, that are sometiems glossed over, or more elaboration on some edge-case behaivor. This is so that it can be used as a reference/entry point for a complete beginner. This is not a  replacement for many other tutorials. I'm treating this as an accessable cliff-notes version of "How to make Neovim somewhat useable sometimes". 

The assumptions made will be that the user knows how to open their terminal, and how to open vi, vim, or nano, but still interfaces with the gui regularly.

The NeoVim docs are extensive, but can sometimes be overwhelming, and the `nvim :help nvim :Tutor` sequence used to learn basic vim motions is not exhaustive when it comes to the Neovim ecosystem. When I do make notes, they are written so that I can reference them, so basic steps are outlined. 

There will be an archive folder which will have the my old config files and setups, including plugins, in the case I want to revert.

Having this managed well, will lead to me being able to keep track of changes, vimscript, and lua changes, and also allow me to quickly get my config, in the case that I'm using a weird shell where the NeoVim installation is not the one in $APPDATA.

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



## TODO

- [ ] Complete directory structure and annotation
