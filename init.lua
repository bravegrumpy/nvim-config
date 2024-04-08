-- setting reasonable quality-of-life defaluts
-- this is a straightforward translation of the vimscript
-- I had before adding/dealing with external plugins

vim.o.ignorecase = true
vim.api.nvim_command('set nohlsearch')
vim.o.number = true
vim.o.relativenumber = true
vim.o.showcmd = true
vim.o.shiftwidth = 4
vim.o.smarttab = true

vim.o.encoding = "utf-8"

-- Setting Mapleader

vim.g.mapleader = ","
vim.highlight.priorities = 100;

-- Adding Mappings

-- Ctrl-w to <leader>w so I don't use control for moving windows.
vim.api.nvim_set_keymap('n', '<leader>w', '<C-w>', { noremap = true })

-- remapping term -> normal to Escape
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true })


-- Using API to create "Initialize Config" Command
vim.api.nvim_create_user_command(
    "InitalizeConfig",
    function()
	vim.fn.mkdir(vim.fn.stdpath("config"), "p")
    end,
    {}
)

-- registering parser to filetypes
vim.treesitter.language.register('python', '.py')

-- Using API to create "EditConfig" command
vim.api.nvim_create_user_command(
    "EditConfig",
    function()
	vim.cmd("edit " .. vim.fn.stdpath("config") .. "/init.lua")
    end,
    {}
)

-- Setting up lazy package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
	"git",
	"clone",
	"--filter=blob:none",
	"https://github.com/folke/lazy.nvim.git",
	"--branch=stable",
	lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate"
    },
    {
	'nvim-telescope/telescope.nvim', tag = '0.1.5',
	requires = { 'nvim-lua/plenary.nvim' }
    },
    {
	"jiaoshijie/undotree",
	dependencies = "nvim-lua/plenary.nvim",
	config = true,
	keys = {
	    { "<leader>u", "cmdlua require('undotree').toggle()<cr>" },
	},
    },
    {
	"EdenEast/nightfox.nvim",
    },
    {
	"folke/todo-comments.nvim",
	dependencies = {"nvim-lua/plenary.nvim"}
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
    {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' }
    }
    -- {
	-- FIXME This doesn't work as expected
	-- I commented it out until I can figure it out
    	-- "NeogitOrg/neogit",
    	-- dependencies = {
    	--     "nvim-lua/plenary.nvim",
    	--     "sindrets/diffview.nvim",
    	--     "nvim-telescope/telescope.nvim"
	-- },
	-- config = true
    -- }

})



-- Commands that need to be called after plugins are loaded

-- Setting Duskfox Colorscheme
vim.cmd("colorscheme duskfox")  

-- Configuring lualine
require('lualine').setup{
    -- TODO: Add a better configuration here
    options = {
	icons_enabled = true,
	theme = "dracula",
	component_separators = { left = '', right = '󱀝' }
    }
}

-- Configuring neogit
-- TODO: decide how to configure Neogit
