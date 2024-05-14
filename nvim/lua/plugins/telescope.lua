return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local telescope = require('telescope')

    -- Telescope configuration
    telescope.setup({
      defaults = {
        -- Layout and appearance configuration
        layout_config = {
          prompt_position = "bottom",
          width = 0.75,
          height = 0.85,
          preview_cutoff = 120,
        },
        border = true,
        prompt_prefix = '  ',
        selection_caret = ' ',
        entry_prefix = '  ',
        initial_mode = 'insert',
        selection_strategy = 'reset',
        sorting_strategy = 'descending',
        layout_strategy = 'horizontal',
      }
    })

    -- Autocmd to apply custom highlight settings at startup
    vim.cmd [[
      augroup TelescopeCustomColors
        autocmd!
        autocmd VimEnter * highlight TelescopeBorder guifg=#252526
        autocmd VimEnter * highlight TelescopePromptBorder guifg=#ebdbb2
        autocmd VimEnter * highlight TelescopeResultsBorder guifg=#ebdbb2
        autocmd VimEnter * highlight TelescopePreviewBorder guifg=#ebdbb2
        autocmd VimEnter * highlight TelescopeTitle guifg=#ebdbb2
        autocmd VimEnter * highlight TelescopePromptCounter guifg=#ebdbb2
        autocmd VimEnter * highlight TelescopePromptTitle guifg=#ebdbb2
        autocmd VimEnter * highlight TelescopeResultsTitle guifg=#ebdbb2
        autocmd VimEnter * highlight TelescopePreviewTitle guifg=#ebdbb2
      augroup END
    ]]

    -- Key mappings for telescope functions
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>f', builtin.find_files, {})
    vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
    vim.keymap.set('n', '<leader>gr', builtin.grep_string, {})
    vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
    vim.keymap.set('n', '<leader>gd', function() git_diff() end)

    function _G.git_diff(opts)
      local pickers = require "telescope.pickers"
      local finders = require "telescope.finders"
      local previewers = require "telescope.previewers"
      local conf = require("telescope.config").values

      local default_branch = vim.fn.system('git symbolic-ref refs/remotes/origin/HEAD --short')
      default_branch = default_branch:gsub("%s+", "")
      local list = vim.fn.systemlist('git diff --relative --name-only ' .. default_branch)

      pickers.new(opts, {
        prompt_title = "Changed Files",
        finder = finders.new_table { results = list },
        sorter = conf.generic_sorter(opts),
        previewer = previewers.vim_buffer_cat.new({}) 
      }):find()
    end
  end
}
