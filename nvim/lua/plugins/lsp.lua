return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local lspconfig = require('lspconfig')

      lspconfig.clangd.setup {}
      lspconfig.rust_analyzer.setup {}
      lspconfig.lua_ls.setup {}

      -- Your diagnostics toggle function
      vim.g.diagnostics_visible = true
      function _G.toggle_diagnostics()
        if vim.g.diagnostics_visible then
          vim.g.diagnostics_visible = false
          vim.diagnostic.hide(nil,0)
        else
          vim.g.diagnostics_visible = true
          vim.diagnostic.show(nil,0)
        end
      end
      vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>d', ':call v:lua.toggle_diagnostics()<CR>', {silent=true, noremap=true})

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<leader>=', function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })
    end,
  },
}

