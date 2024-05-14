vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>s", "<cmd>ClangdSwitchSourceHeader<cr>", opts)
vim.keymap.set('n', '<leader>n', ':set number | set relativenumber!<CR>', { noremap = true, silent = true })

-- Modify buffers
vim.keymap.set('n', '<leader>v', '<C-w>v<C-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Move lines up and down with Alt+j and Alt+k
vim.api.nvim_set_keymap('n', '<M-j>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-k>', ':m .-2<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<M-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<M-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- H and L movements
vim.api.nvim_set_keymap('n', 'H', '^', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'L', '$', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-f>', '<C-f>zz', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-b>', '<C-b>zz', {noremap = true, silent = true})

-- netrw toggle
local toggle_state = false
function ToggleNetrw()
    if toggle_state then
        vim.cmd(':Lex')
    else
        vim.cmd(':15Lex %:p:h')
    end
    toggle_state = not toggle_state
end

vim.keymap.set('n', '<leader>t', ':lua ToggleNetrw()<CR>', { noremap = true, silent = true})
