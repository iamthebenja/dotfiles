local M = {}

local utils = require("iamthebenja.lsp.utils")

M.config = vim.tbl_extend("force", utils.base_config, {
    cmd = { "gopls", "serve" },
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
})

return M
