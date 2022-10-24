-- LSP set up copied from https://github.com/Gelio/ubuntu-dotfiles/blob/master/install/neovim/stowed/.config/nvim/lua/lsp/init.lua
local utils = require("config.lsp.utils")
local nvim_lsp = require("lspconfig")

local servers_with_defaults = { "bashls", "cssls", "eslint", "svelte", "yamlls", "vimls" }
for _, lsp in ipairs(servers_with_defaults) do
	nvim_lsp[lsp].setup(utils.base_config)
end

-- Conflicts with prettier formatting in TS files.
--nvim_lsp.stylelint_lsp.setup(utils.base_config_without_formatting)

nvim_lsp.jsonls.setup(require("config.lsp.jsonls").config)

nvim_lsp.graphql.setup(require("config.lsp.graphql").config)

local null_ls = require("config.lsp.null-ls")
require("null-ls").setup({
	sources = null_ls.sources,
	on_attach = null_ls.config.on_attach,
	capabilities = null_ls.config.capabilities,
})

nvim_lsp.tsserver.setup(require("config.lsp.tsserver").config)
nvim_lsp.gopls.setup(require("config.lsp.gopls").config)
nvim_lsp.prismals.setup(utils.base_config)
nvim_lsp.rust_analyzer.setup(require("config.lsp.rust_analyzer").config)
