-- setting reasonable quality-of-life defaluts
-- this is a straightforward translation of the vimscript
-- I had before adding/dealing with external plugins

vim.o.ignorecase = true
vim.api.nvim_command('set nohlsearch')
vim.highlight.on_yank()
vim.o.number = true
vim.o.relativenumber = true
vim.o.showcmd = true
vim.o.shiftwidth = 4
vim.o.smarttab = true



-- Using API to create "Initialize Config" Command
vim.api.nvim_create_user_command(
    "InitalizeConfig",
    function()
	vm.fn.mkdir(vim.fn.stdpath("config"), "p")
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