" Do this in lua?? maybe...
" vim.o is short for something teej thinks makes sense.
set completeopt=menu,menuone,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

fun! LspLocationList()
    " lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
endfun

nnoremap <leader>ld :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>li :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>lsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>lrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>lrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>lh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>lca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>lsd :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <leader>ln :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>lll :call LspLocationList()<CR>
