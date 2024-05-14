return {
  'lukas-reineke/indent-blankline.nvim',
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- Define the highlight group
    local highlight = {
      "Gray",
    }

    local hooks = require "ibl.hooks"
    -- Create the highlight group in the highlight setup hook, so it is reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "Gray", { fg = "#2D2D2D" })
    end)

    -- Setting up the indent-blankline.nvim plugin
    require("ibl").setup {
      indent = { highlight = highlight, char = '┊' },
      whitespace = {
        remove_blankline_trail = false,
      },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
        highlight = { "Function", "Label" },
      },
    }
  end
}
