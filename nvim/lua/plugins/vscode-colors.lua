return {
  {
    "Mofiqul/vscode.nvim",
    config = function()
      vim.o.background = 'dark' -- Set the background to dark

      -- Get the color definitions from vscode.nvim
      local c = require('vscode.colors').get_colors()

      -- Setup vscode.nvim theme with additional configurations
      require('vscode').setup({
        -- Enable transparent background
        transparent = true,

        -- Disable nvim-tree background color
        disable_nvimtree_bg = true,

        -- Override specific colors
        color_overrides = {
          vscLineNumber = '#FADA5E',
        },

        -- Override highlight groups
        group_overrides = {
          -- this supports the same val table as vim.api.nvim_set_hl
          -- use colors from this colorscheme by requiring vscode.colors!
          Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
        }
      })
    require('vscode').load()
    end
  }
}

