require('rose-pine').setup({})

function SetupColors(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)
end

SetupColors()
