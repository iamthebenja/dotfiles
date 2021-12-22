local M = {}

local function setup_formatting(client, bufnr)
    if client.resolved_capabilities.document_formatting then
        vim.cmd([[
            augroup SyncFormatting
                autocmd! BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
        ]])
    end
end

local function setup_doc_highlight(client)
    if not client.resolved_capabilities.document_highlight then
        return
    end

    vim.cmd([[
        hi LspReferenceText cterm=bold ctermbg=red guibg=#404040
        hi LspReferenceRead cterm=bold ctermbg=red guibg=#404040
        hi LspReferenceWrite cterm=bold ctermbg=red guibg=#404040
        augroup LSPDocumentHighlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorHold <buffer> lua vim.lsp.buf.clear_references()
        augroup END
    ]], false)
end

function M.on_attach(client, bufnr)
    setup_formatting(client, bufnr)
    setup_doc_highlight(client, bufnr)
end

-- See https://github.com/hrsh7th/cmp-nvim-lsp
-- Takes care of autocomplete support using snippets for some LSP servers (cssls, jsonls)
M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").update_capabilities(M.capabilities)

-- Return a function that runs functions passed in the argument.
-- They will be called in the same order that they were passed in.
-- Useful for composing multiple `on_attach` functions.
---@diagnostic disable-next-line: unused-vararg
function M.run_all(...)
	local fns = { ... }

	return function(...)
		for _, fn in ipairs(fns) do
			fn(...)
		end
	end
end

-- Disables formatting for an LSP client
-- Useful when multiple clients are capable of formatting
-- but we want to enable only one of them.
function M.disable_formatting(client)
	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false
end

-- Base config for LSP's setup method
M.base_config = {
	on_attach = M.on_attach,
	capabilities = M.capabilities,
}

-- Base config for LSP's setup method that disables client's formatting
-- Useful when there is another client that is responsible for formatting.
M.base_config_without_formatting = vim.tbl_extend("force", M.base_config, {
	on_attach = M.run_all(M.disable_formatting, M.on_attach),
})

return M
