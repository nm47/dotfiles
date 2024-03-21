-- To enable the colorscheme and settings for 'indent-blankline.nvim' plugin
local highlight = {
    "CursorColumn",
    "Whitespace",
}
require("ibl").setup {
    indent = { highlight = highlight, char = '┊' },
        whitespace = {
        remove_blankline_trail = false,
    },
}
