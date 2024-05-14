vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require 'config.set'
require 'config.remap'
require('lazy').setup('plugins', {
  defaults = {
    lazy = false,
    version = false,
  },
  install = {
  },
  performance = {
    rtp = {
      disabled_plugins = {
      },
    },
  },
})

