local capabilities = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())
local opts = { noremap=true, silent=true }                                      
                                                                                
local on_attach = function(client, bufnr)                                       
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
end                                                                             
                                                                                
require'lspconfig'.pyright.setup{                                               
    on_attach = on_attach,                                                      
    capabilities = capabilities                                                 
}    
