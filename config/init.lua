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

--Using Solarized Color Scheme 


-- Using API to create "Initialize Config" Command
vim.api.nvim_create_user_command(
    "InitalizeConfig",
    function()
	vim.fn.mkdir(vim.fn.stdpath("config"), "p")
    end,
    {}
)

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
	build = ":TSUpdate",
    },
    {
	'nvim-telescope/telescope.nvim', tag='0.1.5',
	requires = { 'nvim-lua/plenary.vim' }
    }
})
