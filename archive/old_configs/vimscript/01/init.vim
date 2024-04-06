set ignorecase
set nohls
set number
set relativenumber
set showcmd
set shiftwidth=4 smarttab
set expandtab
set tabstop=8 softtabstop=0
set history=256
set textwidth=80
set background=dark
set encoding=utf-8
set shell=\"c:\msys64\ucrt64.exe\"\


command InitializeConfig :call mkdir(stdpath('config'), 'p')

command EditConfig :exe 'edit' stdpath('config').'/init.vim'
filetype plugin indent on


lua <<EOF
-- adding mapleaders
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- boostrapping lazyvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Starting Plugin
require("lazy").setup({
    "folke/which-key.nvim",
    {"folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    {
        "jiaoshijie/undotree",
        dependencies = "nvim-lua/plenary.nvim",
        config = true,
        keys = {
            {"<leader>u", "<cmd>lua require('undotree').toggle()<cr>"},
        },
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { 'nvim-lua/plenary.nvim' },
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    },
})

EOF
