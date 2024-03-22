vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>s", "<cmd>ClangdSwitchSourceHeader<cr>", opts)
vim.keymap.set('n', '<leader>n', ':set number! | set relativenumber!<CR>', { noremap = true, silent = true })

-- Modify buffers with C + hjkl
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<C-M-h>', ':vertical resize +2<CR>', {silent = true})
vim.keymap.set('n', '<C-M-j>', ':resize +2<CR>', {silent = true})
vim.keymap.set('n', '<C-M-k>', ':resize -2<CR>', {silent = true})
vim.keymap.set('n', '<C-M-l>', ':vertical resize -2<CR>', {silent = true})

vim.keymap.set('n', '<leader>tt', ':18Lex %:p:h<CR>', {silent = true})
vim.keymap.set('n', '<leader>=', '<C-w>=', {silent = true})

-- Move lines up and down with Alt+j and Alt+k
vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

