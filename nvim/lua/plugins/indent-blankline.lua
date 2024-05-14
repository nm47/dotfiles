return {
  'lukas-reineke/indent-blankline.nvim', 
  config = function()
    local highlight = {
      "CursorColumn",
      "Whitespace",
    }

    -- Setting up the indent-blankline.nvim plugin
    require("ibl").setup {
      indent = { char = '┊' },
      whitespace = {
        remove_blankline_trail = false,
      },
    }
  end
}

