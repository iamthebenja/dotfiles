local M = {}

local utils = require("iamthebenja.lsp.utils")

M.config = vim.tbl_extend("force", utils.base_config, {
    cmd = { "rust-analyzer" },
})

return M