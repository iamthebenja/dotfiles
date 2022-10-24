local Remap = require("config.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<leader>ts", function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
end, { desc = "Telescope grep string" })

nnoremap("<C-p>", function()
    require('telescope.builtin').git_files()
end, { desc = "Telescope git files" })

nnoremap("<Leader>tf", function()
    require('telescope.builtin').find_files()
end, { desc = "Telescope find files" })

nnoremap("<leader>tw", function()
    require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
end, { desc = "Telescope find word" })

nnoremap("<leader>tb", function()
    require('telescope.builtin').buffers()
end, { desc = "Telescope buffers" })

nnoremap("<leader>th", function()
    require('telescope.builtin').help_tags()
end, { desc = "Telescope help tags" })

nnoremap("<leader>td", function()
    require('iamthebenja.telescope').search_dotfiles({ hidden = true })
end, { desc = "Telescope search dotfiles" })

nnoremap("<leader>tk", function()
    require('telescope.builtin').keymaps()
end, { desc = "Telescope keymaps" })

nnoremap("<leader>tgb", function()
    require('iamthebenja.telescope').git_branches()
end, { desc = "Telescope git branches" })

nnoremap("<leader>tgw", function()
    require('telescope').extensions.git_worktree.git_worktrees()
end, { desc = "Telescope git worktree" })

nnoremap("<leader>tgwc", function()
    require('telescope').extensions.git_worktree.create_git_worktree()
end, { desc = "Telescope create git worktree" })


