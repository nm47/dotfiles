vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.fillchars='eob: '
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cursorline = true

-- Persistent undo - allows undoing changes after closing and reopening files
local undodir = vim.fn.stdpath("config") .. "/undo" -- Change the path as needed
vim.opt.undodir = undodir
vim.opt.undofile = true -- Enable undofile

-- Ensure the directory for undofiles exists
if not vim.loop.fs_stat(undodir) then
  vim.loop.fs_mkdir(undodir, 511) -- 511 decimal is 0777 octal
end

-- Path for swap files
local swapdir = vim.fn.stdpath("config") .. "/swap"

-- Ensure the swap directory exists
if not vim.loop.fs_stat(swapdir) then
  vim.loop.fs_mkdir(swapdir, 511) -- 511 decimal is 0777 octal
end

-- Set Neovim to store swap files in the specified directory
vim.opt.directory = swapdir
vim.g.netrw_banner = 0
