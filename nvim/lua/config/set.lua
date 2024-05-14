vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.fillchars='eob: '
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cursorline = true
vim.opt.scrolloff = 5
vim.opt.swapfile = false

-- Persistent undo - allows undoing changes after closing and reopening files
local undodir = vim.fn.stdpath("config") .. "/undo" -- Change the path as needed
vim.opt.undodir = undodir
vim.opt.undofile = true -- Enable undofile

-- Ensure the directory for undofiles exists
if not vim.loop.fs_stat(undodir) then
  vim.loop.fs_mkdir(undodir, 511) -- 511 decimal is 0777 octal
end

vim.g.netrw_banner = 0
